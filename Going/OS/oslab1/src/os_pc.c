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
















// to be deleted except os_run()

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


// producer and consumer

sem_t empty, fill;
int left = 0;
int right = 0;
// #2
static void producer(void *arg) {
  while (1) {
    kmt->sem_wait(&empty);
    printf("%s", (char*)arg); left++;
    printf("%d", left-right);
    if (left - right < 0) _halt(1);
    kmt->sem_signal(&fill);
  }
}
// #1
static void consumer(void *arg) {
  while (1) {
    kmt->sem_wait(&fill);
    printf("%s", (char*)arg); right++;
    printf("%d", left-right);
    if (left - right < 0) _halt(1);
    kmt->sem_signal(&empty);
  }
}

static void test_run() {
  kmt->sem_init(&empty, "empty", BUF_SIZE);
  kmt->sem_init(&fill, "fill", 0);
  kmt->create(new_thread(), producer, (void*)"(");
  kmt->create(new_thread(), consumer, (void*)")");
}
/* only for test end*/

static void os_run() {
  _intr_write(1); // enable interrupt
  test_run();
  while (1) ; // should never return
}
