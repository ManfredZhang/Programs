# oslab1 - 内核多线程 实验报告

###### 张铭方 161220169

#### 多线程运行原理

> 操作系统中运行若干共享内存的线程，每个线程有共享的代码和数据、独立的堆栈(但在同一地址空间)和寄存器现场。我们通过寄存器现场切换来实现分时的多线程。

在 `os->run()` 中执行 `kmt->create()` 完成一个新线程的堆栈和寄存器现场创建，之后在 `os->interrupt()` 中每当时钟中断来临，先保存当前运行的寄存器现场，再调用 `kmt->schedule()` 选择下一个该运行的线程，并设置当前的运行寄存器现场为下一个进程的寄存器现场，继续运行。

##### 运行测试

```c
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
```

![屏幕快照 2018-05-19 上午12.03.53](/Users/manfred/Desktop/屏幕快照 2018-05-19 上午12.03.53.png)

*遇到的问题：在重新调度同一线程时重新执行该线程*

*解决：通过 `os->interrupt()` 接受的 `regs` 参数保存运行的当前环境*

*通过以上截图可看出问题已经解决*







#### 生产者消费者问题

通过 P、V 信号量解决

##### 运行测试

```c
sem_t empty, fill;
int left = 0;
int right = 0;
static void producer(void *arg) {
  while (1) {
    kmt->sem_wait(&empty);
    printf("%s", (char*)arg); left++;
    printf("%d", left-right);
    if (left - right < 0) _halt(1);
    kmt->sem_signal(&fill);
  }
}
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
```

设置 `BUF_SIZE` 为 `200`

得到结果![屏幕快照 2018-05-19 上午12.10.11](/Users/manfred/Desktop/屏幕快照 2018-05-19 上午12.10.11.png)







#### 物理内存的分配和释放

实现同 `malloc` 实验，除了要实现 `brk()` 和 `sbrk()`

根据 manual 实现：

> brk() sets the end of the data segment  to  the  value  specified  by addr,  when  that  value is reasonable, the system has enough memory, and the process does not exceed its  maximum  data  size  (see  setr‐limit(2)).
>
> sbrk() increments the program's data space by increment bytes.  Calling sbrk() with an increment of 0 can be used  to  find  the  current location of the program break.

*遇到的问题：*

*难以测试实现是否正确*

