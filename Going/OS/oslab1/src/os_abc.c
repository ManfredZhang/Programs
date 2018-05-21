#include <os.h>
#define NUM_OF_THREAD 20

static void os_init();
static void os_run();
static _RegSet *os_interrupt(_Event ev, _RegSet *regs);

MOD_DEF(os) {
  .init = os_init,
  .run = os_run,
  .interrupt = os_interrupt,
};

static void os_init() {
  for (const char *p = "Hello, OS World!\n"; *p; p++) {
    _putc(*p);
  }
}

static _RegSet *os_interrupt(_Event ev, _RegSet *regs) {
  if (ev.event == _EVENT_IRQ_TIMER) {
  	// save the running context to current running thread control block
    if (!ori_regs) tb_pool[curIndex].regset = regs; 
    // there is an "if" so that a functional thread regs would not be erased

    // return the next-to-run thread's context 
    _RegSet *new_reg = (kmt->schedule())->regset;
    // answer to the "if" mentioned above
    if (ori_regs) ori_regs = 0;
    return new_reg;
  }
  if (ev.event == _EVENT_IRQ_IODEV) printf("iodev\n");
  if (ev.event == _EVENT_YIELD) printf("yield\n");
  if (ev.event == _EVENT_SYSCALL) printf("syscall\n");
  
  if (ev.event == _EVENT_ERROR) {
    _putc('x');
    _halt(1);
  }
  return NULL; // this is allowed by AM
}
















// to be deleted expect os_run()

thread_t *new_thread() {
  int i;
  for (i = 0; i < NUM_OF_THREAD; ++i) {
    if (tb_pool[i].used == 0) {
      printf("Choose thread #%d\n", i);
      break;
    }
  }
  return &tb_pool[i];
}

spinlock_t *get_lock() {
  return &lk_pool[0];
}

static void f(void *arg) {
  kmt->spin_lock(get_lock());

  int i = 0;
  while (i<50) {
    printf("%s ", (char*)arg);
    i++;
  }
  kmt->spin_unlock(get_lock());
  while (1) printf("0 ");
}

static void test_run() {
  kmt->create(new_thread(), f, (void*)"a");
  kmt->create(new_thread(), f, (void*)"b");
  kmt->create(new_thread(), f, (void*)"c");
}
/* only for test end*/

static void os_run() {
  _intr_write(1); // enable interrupt
  test_run();
  while (1) ; // should never return
}
