#include <os.h>

static void kmt_init();
static int kmt_create(thread_t *thread, void (*entry)(void *arg), void *arg);
static void kmt_teardown(thread_t *thread);
static thread_t *kmt_schedule();
static void kmt_spin_init(spinlock_t *lk, const char *name);
static void kmt_spin_lock(spinlock_t *lk);
static void kmt_spin_unlock(spinlock_t *lk);
static void kmt_sem_init(sem_t *sem, const char *name, int value);
static void kmt_sem_wait(sem_t *sem);
static void kmt_sem_signal(sem_t *sem);

MOD_DEF(kmt) {
	.init = kmt_init,
	.create = kmt_create,
	.teardown = kmt_teardown,
	.schedule = kmt_schedule,
	.spin_init = kmt_spin_init,
	.spin_lock = kmt_spin_lock,
	.spin_unlock = kmt_spin_unlock,
	.sem_init = kmt_sem_init,
	.sem_wait = kmt_sem_wait,
	.sem_signal = kmt_sem_signal,
};

static void kmt_init() {
	// thread init
	ori_regs = 1;
	num_running = 0;
  curIndex = 0;
  for (int i = 0; i < NUM_OF_THREAD; ++i) {
  	tb_pool[i].id = i;
  	for (int j = 0; j < 32; ++j) tb_pool[i].fence1[j] = 0xcc;
  	for (int j = 0; j < STACK_SIZE; ++j) tb_pool[i].stack[j] = 0;
  	for (int j = 0; j < 32; ++j) tb_pool[i].fence2[j] = 0xcc;
    tb_pool[i].used = 0;
	tb_pool[i].regset = NULL;
  }

  // lock init
  num_lock = 0;
  num_locked = 0;
  for (int i = 0; i < NUM_OF_LOCK; ++i) {
  	lk_pool[i].id = i;
  	lk_pool[i].islock = 0;
  	lk_pool[i].used = 0;
  }

}




// 在系统中创建一个新的线程(入口地址为entry, 参数为arg)，
// 它立即就可以被调度执行(但调用create时中断可能处于关闭状态，
// 在打开中断后它才获得被调度执行的权利)；
static int kmt_create(thread_t *thread, void (*entry)(void *arg), void *arg) {
	// put a new thread into an available position in tb_pool
	int avnum;
	for (avnum = 0; avnum < NUM_OF_THREAD; ++avnum) {
		if (tb_pool[avnum].used == 0) {
		  tb_pool[avnum].used = 1;
		  break;
		}
	}
	tb_pool[avnum] = *thread;
	num_running++;

	// set the reg environment for the new thread
	_Area kstack;
	kstack.start = tb_pool[avnum].stack;
	kstack.end = &(tb_pool[avnum].stack[STACK_SIZE-1]);
	tb_pool[avnum].regset = _make(kstack, entry, arg);

	ori_thread = 0;

	return 0;
}

// 为线程调度器，调用将返回下一个可运行的线程。
// 通常会在中断中调用kmt->schedule()并获得中断返回时的寄存器现场；
static thread_t *kmt_schedule() {
	printf("\nSchedule #%d in %d\n", curIndex+1, num_running);

	// detect if a thread's stack is overflowed by a magic num 0xcc
	for (int i = 0; i < 32; ++i) {
		if (tb_pool[curIndex].fence1[i] != 0xcc || tb_pool[curIndex].fence2[i] != 0xcc) {
			printf("Stack overflow, because magic number is changed\n");
			_halt(1);
		}
	}

	// set the current-run thread index to next-to-run thread index 
	curIndex = (curIndex+1)%num_running;

	// detect if a thread's stack is overflowed by a magic num 0xcc
	for (int i = 0; i < 32; ++i) {
		if (tb_pool[curIndex].fence1[i] != 0xcc || tb_pool[curIndex].fence2[i] != 0xcc) {
			printf("Stack overflow, because magic number is changed\n");
			_halt(1);
		}
	}
	
	// and return the next to run thread control block
	return &tb_pool[curIndex];
}

// 回收线程相关的资源；
static void kmt_teardown(thread_t *thread) {
	for (int i = 0; i < STACK_SIZE; ++i)
		thread->stack[i] = 0;
	for (int i = 0; i < 32; ++i) {
		thread->fence1[i] = 0xcc;
		thread->fence2[i] = 0xcc;
	}
	thread->used = 0;
	thread->regset = NULL;
	num_running--;
}

// 初始化一个自旋锁。
// 在单处理器系统中，自旋锁可以通过关闭中断实现。
// 自旋锁的名字方便大家用来调试。
static void kmt_spin_init(spinlock_t *lk, const char *name) {
	// printf("kmt spin init\n");
}

static void kmt_spin_lock(spinlock_t *lk) {
	if (_intr_read() == 1) {_intr_write(0); return;}
	while (_intr_read() == 0) ;
}

static void kmt_spin_unlock(spinlock_t *lk){
	_intr_write(1);
}

// 初始化一个信号量，初始的计数器为value。
// 信号量有名字也方便大家调试(记录P/V操作的顺序)。
static void kmt_sem_init(sem_t *sem, const char *name, int value) {
	sem->name = name;
	sem->count = value;
}

// 执行信号量的 P 操作。
static void kmt_sem_wait(sem_t *sem) {
	kmt->spin_lock(get_lock()); 
	int been_waiting = 0;
	while (sem->count == 0) {
		kmt->spin_unlock(get_lock());
		been_waiting = 1;
	}
	// there is resources left then try to get locked again
	if (been_waiting) kmt->spin_lock(get_lock());
	sem->count--; 
	kmt->spin_unlock(get_lock());
}

// 执行信号量的 V 操作。
static void kmt_sem_signal(sem_t *sem) {
	kmt->spin_lock(get_lock());
	sem->count++;  
	kmt->spin_unlock(get_lock());
}