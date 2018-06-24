#ifndef __OS_H__
#define __OS_H__

#define NUM_OF_THREAD 20
#define STACK_SIZE 4096
#define NUM_OF_LOCK 1
#define BUF_SIZE 200
#define MAX_FD 99999
#define MAX_MOUNT 50
#define MAX_INODE 1000 // all fs
#define DATA_SIZE 1000

#define SEEK_SET 0
#define SEEK_CUR 1
#define SEEK_END 2

#include <kernel.h>

static inline void puts(const char *p) {
  for (; *p; p++) {
    _putc(*p);
  }
}

#endif

int printf(const char *string, ...);
int zstrcmp(const char *s1, const char *s2);
int zstrlen(const char *s);

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





typedef struct fsops {
  void (*init)(struct filesystem *fs, const char *name, inode_t *dev);
  inode_t *(*lookup)(struct filesystem *fs, const char *path, int flags);
  int (*close)(inode_t *inode);
} fsops_t;

// 是一个打开的文件，注意系统中打开的文件不等于inode
// ——多个进程/线程可能多次打开同一个文件，会得到不同的file_t；
// 而在进程fork的时候，父子进程的文件描述符都指向同一个file_t。

typedef struct file {
  int offset;
  int flags;
} file_t;

typedef struct inode {
  char path[BUF_SIZE];
  int mode; // rw 00 01 10 11
  char file_data[DATA_SIZE];
  int end_of_file;
  file_t opened_file[MAX_FD];
  int opened_file_cnt;
} inode_t;

// 挂载的就是文件系统，从路径到inode的解析也是由文件系统最终完成的；
typedef struct filesystem {
  char name[BUF_SIZE];
  fsops_t *ops;
  inode_t inode[MAX_INODE];
  int used_inode_num;
  char rest_path[BUF_SIZE];
} filesystem_t;

// 系统中的每个文件系统都对应了一个filesystem_t的对象，挂载到文件系统中的某个位置。
// 通过这个对象，我们可以得到文件系统中的inodes (inode_t对象)
// ，通过打开inode得到打开的文件(file_t对象)。



filesystem_t *create_procfs();
filesystem_t *create_devfs();
filesystem_t *create_kvfs();

struct path_map_fs_struct {
  char path[BUF_SIZE];
  int path_btcnt;
  filesystem_t *fs;
} path_map_fs[MAX_MOUNT];
int mount_count;



int fd_array[MAX_FD];


struct path_map_inode_struct {
  char path[BUF_SIZE];
  inode_t *inode;
} path_map_inode[MAX_INODE];

int inode_count;

struct fd_map_file_struct {
  int fd;
  file_t *file;
  inode_t *inode;
} fd_map_file[MAX_FD];

int fd_count;

inode_t *cur_inode;

sem_t only;

int pr;
// int safe;