#include <os.h>
#include <string.h>

static void vfs_init();
static int vfs_access(const char *path, int mode);
static int vfs_mount(const char *path, filesystem_t *fs);
static int vfs_unmount(const char *path);
static int vfs_open(const char *path, int flags);
static ssize_t vfs_read(int fd, void *buf, size_t nbyte);
static ssize_t vfs_write(int fd, void *buf, size_t nbyte);
static off_t vfs_lseek(int fd, off_t offset, int whence);
static int vfs_close(int fd);

MOD_DEF(vfs) {
  .init = vfs_init,
  .access = vfs_access,
  .mount = vfs_mount,
  .unmount = vfs_unmount,
  .open = vfs_open,
  .read = vfs_read,
  .write = vfs_write,
  .lseek = vfs_lseek,
  .close = vfs_close,
};

static int get_fd() {
	for (int i = 0; i < MAX_FD; ++i)
		if (fd_array[i] == 0)
			return i;
	if (pr) printf("all fd have been used\n");
	return -1;
}

static void vfs_init() {

	pr = 1;
	if (pr) printf("vfs_init\n");
	mount_count = 0;
	inode_count = 0;
	fd_count = 0;

	for (int i = 0; i < MAX_FD; ++i)
		fd_map_file[i].fd = -1;

	for (int i = 0; i < MAX_FD; ++i)
		fd_array[i] = 0;

	kmt->sem_init(&only, "only", 1);

	vfs->mount("/proc", create_procfs());
	vfs->mount("/dev", create_devfs());
	vfs->mount("/", create_kvfs());

	pr = 0;
	int fdcpu = vfs->open("/proc/cpuinfo",11);
	int fdmem = vfs->open("/proc/meminfo",11);
	vfs->write(fdcpu, "cpuname: qemu", zstrlen("cpuname: qemu"));
	vfs->write(fdmem, "memery: limited", zstrlen("memery: limited"));
	
	char *nnull = "\0";
  	char *zzero = "0000000000000000000";
  	char *rrandom = "01001001010001010";
	int devnull = vfs->open("/dev/null", 11);
	int devzero = vfs->open("/dev/zero", 11);
	int devrandom = vfs->open("/dev/random", 11);
	vfs->write(devnull, nnull, 1);
	vfs->write(devzero, zzero, zstrlen(zzero));
	vfs->write(devrandom, rrandom, zstrlen(rrandom));
	pr = 1;
}

static int get_fs(const char *path) {
	int path_btcnt = 1;
	while (path[path_btcnt] != '/' && path[path_btcnt] != '\0') path_btcnt++;

	int match = 1;
	int related_fs = MAX_MOUNT+5;
	for (int i = 0; i < mount_count; ++i) {
		if (path_map_fs[i].path_btcnt == path_btcnt) {
			for (int j = 0; j < path_btcnt; ++j) {
				if (path[j] != path_map_fs[i].path[j]) {
					match = 0;
					break;
				}
			}
			if (match)
				related_fs = i;
		}
	}
	if (related_fs == MAX_MOUNT+5) related_fs = 2;
	return related_fs;
}

static int vfs_access(const char *path, int mode) {
	kmt->sem_wait(&only);

	// find the corresponding fs 
	int related_fs = get_fs(path);
	if (pr) printf("find the related fs: %s\n", path_map_fs[related_fs].fs->name);


	// if the inode doesn't exist return 0
	// else if the inode can be open with the certain mode return 1
	// else return -1
	filesystem_t *cur_fs = path_map_fs[related_fs].fs;
	
	cur_inode = cur_fs->ops->lookup(cur_fs, path, mode);
	if (cur_inode->mode == -1) {
		if (pr) printf("inode does not exist\n");
		kmt->sem_signal(&only);
		return 0;// not exist
	}
	if (mode == cur_inode->mode || cur_inode->mode == 11) {
		if (pr) printf("\033[31mSUCCESS\033[0m - access\n");
		kmt->sem_signal(&only);
		return 1; // can access
	}
	else {
		if (pr) printf("access fail, mode: %d cur_inode->mode: \n", mode, cur_inode->mode);
		kmt->sem_signal(&only);
		return -1; // can't access
	}
}

static int vfs_mount(const char *path, filesystem_t *fs) {
	kmt->sem_wait(&only);
	int i;
	for (i = 0; path[i] != '\0'; ++i)
		path_map_fs[mount_count].path[i] = path[i];
	path_map_fs[mount_count].path[i] = '\0';

	path_map_fs[mount_count].path_btcnt = i;
	path_map_fs[mount_count].fs = fs;
	mount_count++;
	if (pr) printf("\033[31mSUCCESS\033[0m - mount fs: %s to path: %s\n", fs->name, path);
	kmt->sem_signal(&only);
	return 0;
}

static int vfs_unmount(const char *path) {
	kmt->sem_wait(&only);
	int related_fs = get_fs(path);
	path_map_fs[related_fs].path[0] = '\0';
	path_map_fs[related_fs].fs = (filesystem_t*)NULL;
	mount_count--;
	kmt->sem_signal(&only);
	return 1;
}

static int vfs_open(const char *path, int flags) {
	kmt->sem_wait(&only);
	// find the corresponding fs 
	int related_fs = get_fs(path);
	filesystem_t *cur_fs = path_map_fs[related_fs].fs;

	kmt->sem_signal(&only);
	int status = vfs->access(path, flags); // also get cur_inode
	kmt->sem_wait(&only);

	if (status == -1) { // can't access
		if (pr) printf("the file has less privilege, can't open\n");
		kmt->sem_signal(&only);
		return -1;
	}

	if (status == 0) { // inode doesn't exist
		int num = cur_fs->used_inode_num;
		int i = 0;
		while (path[i] != '\0') {
			cur_fs->inode[num].path[i] = path[i];
			path_map_inode[inode_count].path[i] = path[i];
			i++;
		}
		path_map_inode[inode_count].path[i] = '\0';
		cur_fs->inode[num].path[i] = '\0';

		path_map_inode[inode_count].inode = &cur_fs->inode[num];
		cur_fs->used_inode_num++;
		inode_count++;

		// init new inode
		cur_fs->inode[num].mode = flags;
		for (int i = 0; i < DATA_SIZE; ++i)
			cur_fs->inode[num].file_data[i] = 0;
		cur_fs->inode[num].end_of_file = 0;
		cur_fs->inode[num].opened_file_cnt = 0;
		
		if (pr) printf("\033[31mSUCCESS\033[0m - create new inode:%s in fs:%s\n", cur_fs->inode[num].path, cur_fs->name);
		status = 1;
	}

	int return_fd = get_fd();
	if (status == 1) { // can access
		if (pr) printf("open an accessible inode\n");
		fd_array[return_fd] = 1;
		int o_f_cnt = cur_inode->opened_file_cnt;
		cur_inode->opened_file_cnt++;

		// init new file
		cur_inode->opened_file[o_f_cnt].offset = 0;
		cur_inode->opened_file[o_f_cnt].flags = flags;

		// build fd_map_file
		fd_map_file[fd_count].fd = return_fd;
		fd_map_file[fd_count].file = &(cur_inode->opened_file[o_f_cnt]);
		fd_map_file[fd_count].inode = cur_inode;
		fd_count++;
		if (pr) printf("\033[31mSUCCESS\033[0m - build a new file\n");
		kmt->sem_signal(&only);
		return return_fd;
	}	

	if (pr) printf("should not reach here\n");
	kmt->sem_signal(&only);
	return -1;
}

static ssize_t vfs_read(int fd, void *buf, size_t nbyte) {
	kmt->sem_wait(&only);

	file_t *cur_file;
	for (int i = 0; i < MAX_FD; ++i) {
		if (fd_map_file[i].fd == fd) {
			cur_file = fd_map_file[i].file;
			cur_inode = fd_map_file[i].inode;
			// printf("hhh %s\n", cur_inode->path);

			if (cur_file->flags > 11) continue;

			if (zstrcmp(cur_inode->path,"/dev/null") == 0) {
				((char*)buf)[0] = '\0';
				kmt->sem_signal(&only);
				return 1; 
			}
			if (cur_file->flags == 10 || cur_file->flags == 11) {
				int offset = cur_file->offset;
				// int offset = 0;
				int cnt = 0;
				// printf("zmf: aoa%saoa\n", cur_inode->file_data);
				for (int j = offset; j < offset+nbyte && cur_inode->file_data[j] != '\0'; ++j)
					((char*)buf)[cnt++] = cur_inode->file_data[j];
				kmt->sem_signal(&only);
				return nbyte;
			}
			else {
				if (pr) printf("file is not opened to be read\n");
				kmt->sem_signal(&only);
				return -1;
			}
		}
	}
	
	panic("bad fd\n");
	kmt->sem_signal(&only);
	return -1;
}

static ssize_t vfs_write(int fd, void *buf, size_t nbyte) {
	kmt->sem_wait(&only);
	file_t *cur_file;
	for (int i = 0; i < MAX_FD; ++i) {
		if (fd_map_file[i].fd == fd) {
			cur_file = fd_map_file[i].file;
			cur_inode = fd_map_file[i].inode;

			if (cur_file->flags > 11) continue;
			if (cur_file->flags == 01 || cur_file->flags == 11) {
				int offset = cur_file->offset;
				for (int j = offset; j < offset+nbyte; ++j)
					cur_inode->file_data[j] = ((char*)buf)[j];
				cur_file->offset += nbyte;
				cur_inode->end_of_file += nbyte;
				kmt->sem_signal(&only);

				return nbyte;
			}
			else {
				if (pr) printf("file is not opened to be written\n");
				kmt->sem_signal(&only);
				return -1;
			}
		}
	}
	
	panic("bad fd\n");
	kmt->sem_signal(&only);
	return -1;
}

static off_t vfs_lseek(int fd, off_t offset, int whence) {
	kmt->sem_wait(&only);
	file_t *cur_file;
	for (int i = 0; i < MAX_FD; ++i) {
		if (fd_map_file[i].fd == fd) {
			cur_file = fd_map_file[i].file;
			cur_inode = fd_map_file[i].inode;

			if (cur_file->flags > 11) continue;
			if (cur_file->flags == 10 || cur_file->flags == 11) {
				if (whence == SEEK_SET) cur_file->offset = offset;
				if (whence == SEEK_CUR) cur_file->offset += offset;
				if (whence == SEEK_END) cur_file->offset = cur_inode->end_of_file + offset;
				kmt->sem_signal(&only);
				return offset;
			}
			else {
				if (pr) printf("file is not opened to be lseeked\n");
				kmt->sem_signal(&only);
				return -1;
			}
		}
	}
	
	panic("bad fd\n");
	kmt->sem_signal(&only);
	return -1;
}

static int vfs_close(int fd) {
	kmt->sem_wait(&only);
	//fd_count--;
	//fd_array[fd] = 0;
	for (int i = 0; i < MAX_FD; ++i) {
		if (fd_map_file[i].fd == fd) {
			fd_map_file[i].file->flags = 00;
			fd_map_file[i].file->offset = 0;
			fd_map_file[i].file = (file_t*)NULL;
			fd_map_file[i].inode = (inode_t*)NULL;
			kmt->sem_signal(&only);
			return 1;
		}
	}
	panic("bad fd\n");
	kmt->sem_signal(&only);
	return -1;
}

void fsop_init(filesystem_t *fs, const char *name, inode_t *dev) {
	fs->used_inode_num = 0;
	int i = 0;
	while (name[i] != '\0') {
		fs->name[i] = name[i];
		i++;
	}
	fs->name[i] = '\0';
	return;
}

inode_t *fsop_lookup(filesystem_t *fs, const char *path, int flags) {
	inode_t *null_inode = (inode_t *)pmm->alloc(sizeof(inode_t));
	null_inode->mode = -1;

	for (int i = 0; i < inode_count; ++i) {
		int cmp = zstrcmp(path, path_map_inode[i].path);
		if (cmp == 0) {
			return path_map_inode[i].inode;
		}
	}
	return null_inode;
}

int fsop_close(inode_t *inode) {
	
	return 0;
}

filesystem_t *create_procfs() {
	filesystem_t *fs = (filesystem_t *)pmm->alloc(sizeof(filesystem_t));
	if (!fs) panic("fs allocation failed");

	fs->ops->init = fsop_init;
	fs->ops->lookup = fsop_lookup;
	fs->ops->close = fsop_close;

	fs->ops->init(fs, "procfs", NULL);
	return fs;
}

filesystem_t *create_devfs() {
	filesystem_t *fs = (filesystem_t *)pmm->alloc(sizeof(filesystem_t));
	if (!fs) panic("fs allocation failed");

	fs->ops->init = fsop_init;
	fs->ops->lookup = fsop_lookup;
	fs->ops->close = fsop_close;

	fs->ops->init(fs, "devfs", NULL);
	return fs;
}

filesystem_t *create_kvfs() {
	filesystem_t *fs = (filesystem_t *)pmm->alloc(sizeof(filesystem_t));
	if (!fs) panic("fs allocation failed");

	fs->ops->init = fsop_init;
	fs->ops->lookup = fsop_lookup;
	fs->ops->close = fsop_close;

	fs->ops->init(fs, "kvfs", NULL);
	return fs;
}