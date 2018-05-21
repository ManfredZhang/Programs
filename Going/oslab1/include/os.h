#ifndef __OS_H__
#define __OS_H__

#define NUM_OF_THREAD 20
#define STACK_SIZE 4096
#define NUM_OF_LOCK 1
#define BUF_SIZE 200

#include <kernel.h>

static inline void puts(const char *p) {
  for (; *p; p++) {
    _putc(*p);
  }
}

#endif

int printf(const char *string, ...);

typedef struct thread {
  int32_t id;
  uint8_t fence1[32];
  uint8_t stack[STACK_SIZE];
  uint8_t fence2[32];
  int used;
  _RegSet *regset;
} thread_t;

typedef struct spinlock {
	int id;
	int islock;
	int used;
} spinlock_t;

typedef struct semaphore {
  const char *name;
	int count;
} sem_t;


int num_running;
int curIndex;
thread_t tb_pool[NUM_OF_THREAD];

int num_lock;
int num_locked;
spinlock_t lk_pool[NUM_OF_LOCK];

int ori_regs;

spinlock_t *get_lock();

int ori_thread;