#include "malloc.h"

#include <stdlib.h>
#include <stdio.h>
#include <pthread.h>
#include <unistd.h>
#include <stdint.h>

#define BLOCK_SIZE 24
extern void *sbrk(intptr_t increment);
extern int brk(void *addr);
pthread_mutex_t mutex;
void *first_block = NULL;

typedef struct s_block *t_block;
struct s_block {
	size_t size;  /* 数据区大小 */
	t_block prev; /* 指向上个块的指针 */
	t_block next; /* 指向下个块的指针 */
	int free;     /* 是否是空闲块 */
	int padding;  /* 填充4字节，保证meta块长度为8的倍数 */
	void *ptr;    /* Magic pointer，指向data */
	char data[1]  /* 这是一个虚拟字段，表示数据块的第一个字节，长度不应计入meta */
};

t_block extend_heap(t_block last, size_t s) {
	t_block b = sbrk(0);
	if(sbrk(BLOCK_SIZE + s) == (void *)-1) return NULL;
	b->size = s;
	b->next = NULL;
	b->free = 0;
	if(last) last->next = b;
	return b;
}

t_block find_block(t_block *carry_block, size_t size) {
	t_block b = first_block;
	while(b && !(b->free == 1 && b->size >= size)) {
		*carry_block = b; // 指针始终指向当前遍历的block
		b = b->next;
	}
	return b;
}

size_t align8(size_t s) {
	if(s & 0x7 == 0) return s;
	else return ((s >> 3) + 1) << 3;
}

void split_block(t_block b, size_t s) {
	t_block new;
	new = b->data + s;
	new->size = b->size - s - BLOCK_SIZE ;
	new->next = b->next;
	new->free = 1;
	b->size = s;
	b->next = new;
}

void* malloc_unsafe(size_t size) {
	size_t s = align8(size);
	t_block b;

	if (first_block) {
		t_block carry_block = first_block;
		b = find_block(&carry_block, s);

		if (b) {
			if ((b->size - s) >= (BLOCK_SIZE + 8))
				split_block(b, s);
			b->free = 0;
		}
		else {
			b = extend_heap(carry_block, s);
			if (!b) return NULL;
		}
	} 
	else {
		b = extend_heap(NULL, s);
		if(!b) return NULL;
		first_block = b;
	}

    return b->data;
}









t_block get_block(void *p) {
    char *tmp;  
    tmp = p;
    return (p = tmp -= BLOCK_SIZE);
}

t_block fusion(t_block b) {
    if (b->next && b->next->free) {
        b->size += BLOCK_SIZE + b->next->size;
        b->next = b->next->next;
        if(b->next)
            b->next->prev = b;
    }
    return b;
}

void free_unsafe(void *ptr) {
    t_block b;
    b = get_block(ptr);
    b->free = 1;
    if (b->prev && b->prev->free)
    	b = fusion(b->prev);
    if (b->next)
    	fusion(b);
    else {
    	if(b->prev)
            b->prev->prev = NULL;
        else
            first_block = NULL;
        brk(b);
    }
}

void* do_malloc(size_t size) {
	pthread_mutex_lock(&mutex);
	void* result = malloc_unsafe(size);
	pthread_mutex_unlock(&mutex);
	return result;
}

void do_free(void *ptr) {
    pthread_mutex_lock(&mutex);
	free_unsafe(ptr);
	pthread_mutex_unlock(&mutex);
}