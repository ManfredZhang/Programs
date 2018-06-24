#include <os.h>
#define BLOCK_SIZE 24


static void pmm_init();
static void *pmm_alloc(size_t size);
static void pmm_free(void *ptr);



MOD_DEF(pmm) {
	.init = pmm_init,
	.alloc = pmm_alloc,
	.free = pmm_free,
};

void *brkp;
void *endp;

static void pmm_init() {
	brkp = _heap.start;
	endp = _heap.end;
}

void *first_block = NULL;


void *sbrk(intptr_t increment) {
	if (increment == 0) return brkp;
	void *free = brkp;

	brkp += increment; 
	if (brkp >= endp) return NULL;
	return free;
}

int brk(void *addr) {
	if (addr >= endp) return -1;
	brkp = addr;
	return 0;
}

typedef struct s_block *t_block;
struct s_block {
	size_t size;  /* 数据区大小 */
	t_block prev; /* 指向上个块的指针 */
	t_block next; /* 指向下个块的指针 */
	int free;     /* 是否是空闲块 */
	int padding;  /* 填充4字节，保证meta块长度为8的倍数 */
	void *ptr;    /* Magic pointer，指向data */
	char data[1];  /* 这是一个虚拟字段，表示数据块的第一个字节，长度不应计入meta */
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
	if((s & 0x7) == 0) return s;
	else return ((s >> 3) + 1) << 3;
}

void split_block(t_block b, size_t s) {
	t_block new;
	new = (t_block)(b->data + s);
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

static void *pmm_alloc(size_t size) {
	kmt->spin_lock(get_lock());
	void* result = malloc_unsafe(size);
	kmt->spin_unlock(get_lock());
	return result;
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

static void pmm_free(void *ptr) {
	kmt->spin_lock(get_lock());
	free_unsafe(ptr);
	kmt->spin_unlock(get_lock());
}