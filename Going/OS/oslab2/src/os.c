#include <os.h>
#include <string.h>
#include <unistd.h>
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
  ori_thread = 1;
}

static _RegSet *os_interrupt(_Event ev, _RegSet *regs) {
  if (ev.event == _EVENT_IRQ_TIMER) {
    if (ori_thread) {printf(""); return NULL;}

  	// save the running context to current running thread control block
    if (!ori_regs) tb_pool[curIndex].regset = regs; 
    // there is an "if" so that a functional thread regs would not be erased

    // return the next-to-run thread's context 
    _RegSet *new_reg = (kmt->schedule())->regset;
    // answer to the "if" mentioned above
    if (ori_regs) ori_regs = 0;
    if (new_reg) return new_reg;
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

char *buuff = "0000000000";
char *bbuff = "1001101010";

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



static void g(void *arg) {
	pr = 0;
	int fd = vfs->open("/kv/testfile",11);

	while (1) {
		char *text = (char*)arg;
		vfs->write(fd, text, zstrlen(text));
		vfs->lseek(fd, 0, SEEK_SET);
		char buf[BUF_SIZE];
		vfs->read(fd, buf, 5);
		printf("test result: %s\n", buf);
	}
	pr = 1;
}

static void see_status(void *arg) {
	char aa[10][100];
	for (int i = 0; i < num_running; ++i) {
		char path[BUF_SIZE];
		path[0] = '/'; path[1] = 'p'; path[2] = 'r'; path[3] = 'o';
		path[4] = 'c'; path[5] = '/'; 
		path[6] = '0'+i;
		path[7] = '/'; path[8] = 's'; path[9] = 't'; path[10] = 'a';
		path[11] = 't'; path[12] = 'u'; path[13] = 's'; 
		char name[BUF_SIZE];
		name[0] = 't'; name[1] = 'h'; name[2] = 'r'; name[3] = 'e';
		name[4] = 'a'; name[5] = 'd'; 
		name[6] = 'n';
		name[7] = 'a'; name[8] = 'm'; name[9] = 'e'; name[10] = ':';
		name[11] = ' '; name[12] = '0'+i; name[13] = '\0';

		int fd = vfs->open(path, 11);
		vfs->write(fd, name, zstrlen(name));

		vfs->lseek(fd, 0, SEEK_SET);
		vfs->read(fd, aa[i], 13);
	}
	while (1) {
		printf("there are %d thread running now\n", num_running);
		for (int i = 0; i < num_running; ++i)
			printf("see thread status: %s\n", aa[i]);
	}
}


static void test_run() {
  kmt->create(new_thread(), g, (void*)"aaaaa");
  kmt->create(new_thread(), g, (void*)"bbbbb");
  kmt->create(new_thread(), g, (void*)"ccccc");
  kmt->create(new_thread(), see_status, (void*)NULL);
}


static void fs_test() {
	vfs->init();printf("\n");

	char *path = "/proc/123/status";
	int flags = 11;
	printf("want to \033[43mACCESS\033[0m path %s\n", path);
	vfs->access(path, flags); printf("\n");

	printf("want to \033[43mOPEN\033[0m from path %s\n", path);
	int fd0 = vfs->open(path, flags); printf("\n");

	printf("want to \033[43mWRITE\033[0m to path %s\n", path);
	char *wbuf = "maybe OS lesson is the best";
	int wnbyte = 27;
	if (vfs->write(fd0, wbuf, wnbyte) != -1)
		printf("\033[31mSUCCESS\033[0m - writed < \033[42m%s\033[0m >\n", wbuf);
	else
		printf("\033[41mFAIL\033[0m - write\n");
	printf("\n");

	printf("want to \033[43mLSEEK\033[0m at path %s\n", path);
	int offset = 6;
	if (vfs->lseek(fd0, offset, SEEK_SET) != -1)
		printf("\033[31mSUCCESS\033[0m - lseeked to %d\n", offset);
	else
		printf("\033[41mFAIL\033[0m - lseek\n");
	printf("\n");

	printf("want to \033[43mREAD\033[0m from path %s\n", path);
	char rbuf[BUF_SIZE];
	int rnbyte = 27;
	if (vfs->read(fd0, rbuf, rnbyte) != -1) 
		printf("\033[31mSUCCESS\033[0m - get < \033[42m%s\033[0m >\n", rbuf); 
	else
		printf("\033[41mFAIL\033[0m - read\n");
	printf("\n");

	flags = 01;
	printf("want to \033[43mOPEN\033[0m from path %s\n", path);
	int fd1 = vfs->open(path, flags); printf("\n");

	printf("want to \033[43mREAD\033[0m from path %s\n", path);
	char rrbuf[BUF_SIZE];
	int rrnbyte = 27;
	if (vfs->read(fd1, rrbuf, rrnbyte) != -1) 
		printf("\033[31mSUCCESS\033[0m - get < \033[42m%s\033[0m >\n", rrbuf); 
	else
		printf("\033[41mFAIL\033[0m - read\n");
	printf("\n");



	printf("want to \033[43mCLOSE\033[0m at path %s\n", path);
	if (vfs->close(fd0) == 1)
		printf("\033[31mSUCCESS\033[0m - close\n");
	printf("\n");


	pr = 0;
	printf("\nDEV TEST\n");
	int devnull = vfs->open("/dev/null", 11);
	int devzero = vfs->open("/dev/zero", 11);
	int devrandom = vfs->open("/dev/random", 11);

	if (vfs->write(devnull, "hello", 5) != -1)
		printf("/dev/null write success\n");
	char bufff[10];
	vfs->read(devnull, bufff, 10);
	if (bufff[0] == '\0')
		printf("/dev/null return \\0\n");

	vfs->lseek(devzero, 0, SEEK_SET);
	vfs->read(devzero, bufff, 10);
	printf("/dev/zero return: %s\n", buuff);

	vfs->lseek(devrandom, 0, SEEK_SET);
	vfs->read(devrandom, bufff, 10);
	printf("/dev/random return: %s\n\n\n", bbuff);
	pr = 1;
}


static void os_run() {
 printf("\n\n");
  _intr_write(1); // enable interrupt
  fs_test();
  test_run();
  while (1) ; // should never return
}
