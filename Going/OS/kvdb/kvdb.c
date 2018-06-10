#include "kvdb.h"
#include <string.h>
#include <stdlib.h>
#include <assert.h>
#include <pthread.h>
#include <sys/file.h>
#include <stdio.h>
#include <unistd.h>

/*
  if we don't want to be blocked when find a locked file,
  such as making a request,
  we can use: flock(fd, LOCK_EX|LOCK_NB);
 
 */

FILE *record_fp;
int record_ready = 0;
char buf[1024];
char contents[1024000];

void recover(kvdb_t *db) {
  printf("start recover\n");
  flock(db->fp->_fileno, LOCK_UN);
  if (fclose(db->fp) != 0) return;

  if ((db->fp = fopen(db->file_name, "w")) == NULL) return;
  if ((record_fp = fopen("record", "r")) == NULL) return;
  

  flock(db->fp->_fileno, LOCK_EX);
  flock(record_fp->_fileno, LOCK_EX);

  if (fseek(record_fp, 0, SEEK_SET) != 0) return;

  int get_stars = 0;
  int writing_offset = 0;
  memset(contents, 0, sizeof(contents));

  while (fgets(buf, 1024, record_fp) != NULL) {
    if (strcmp(buf, "*****\n") == 0){
      get_stars = 1;
      writing_offset = 0;
      memset(contents, 0, sizeof(contents));
    }
    else {
      if (get_stars == 0) continue;
      else if (strcmp(buf, "-----\n") == 0) {
        fwrite(contents, 1, strlen(contents), db->fp);
        if (ferror(db->fp)) return;
        get_stars = 0;
        memset(contents, 0, sizeof(contents));
        writing_offset = 0;
      }
      else {
        int temp_offset = sprintf(contents + writing_offset, "%s", buf);
        if (temp_offset == -1) return;
        writing_offset += temp_offset;
      }
    }
  }
  
  flock(record_fp->_fileno, LOCK_UN);
  if (fclose(record_fp) != 0) return;

  flock(db->fp->_fileno, LOCK_UN);
  if (fclose(db->fp) != 0) return;
}

int kvdb_open(kvdb_t *db, const char *filename) {
  // BUG: no error checking
  pthread_mutex_lock(&(db->mutex));

  strcpy(db->file_name, filename);
  db->fp = fopen(filename, "a+");

  recover(db);
  // printf("okok\n");
  // see_all(db);
  // printf("okok\n");
  db->fp = fopen(filename, "a+");

  pthread_mutex_unlock(&(db->mutex));
  if (db->fp == NULL) return -1;
  return 0;
}

int kvdb_close(kvdb_t *db) {
  // BUG: no error checking
  pthread_mutex_lock(&(db->mutex));
  int fd = fileno(db->fp);
  flock(fd, LOCK_EX);

  int ret = fclose(db->fp);

  fsync(fd);
  flock(fd, LOCK_UN);
  pthread_mutex_unlock(&(db->mutex));
  if (ret != 0) return -1;
  return 0;
}

char *kvdb_get(kvdb_t *db, const char *key) {
  // BUG: no error checking
  pthread_mutex_lock(&(db->mutex));
  int fd = fileno(db->fp);
  flock(fd, LOCK_EX);

  static char _key[1 << 20], _value[1 << 20];
  char *ret = NULL;
  fseek(db->fp, 0, SEEK_SET);
  while (1) {
    if (!fgets(_key, sizeof(_key), db->fp)) break;
    if (!fgets(_value, sizeof(_value), db->fp)) break;
    _key[strlen(_key) - 1] = '\0';
    _value[strlen(_value) - 1] = '\0';
    if (strcmp(key, _key) == 0) {
      if (!ret) free(ret);
      ret = strdup(_value);
    }
  }

  fsync(fd);
  flock(fd, LOCK_UN);
  pthread_mutex_unlock(&(db->mutex));
  return ret;
}

int kvdb_put(kvdb_t *db, const char *key, const char *value) {
  // BUG: no error checking
  pthread_mutex_lock(&(db->mutex));
  int fd = fileno(db->fp);
  flock(fd, LOCK_EX);
  int ret;


/* record a log begin */
  record_ready = 0;
  if ((record_fp = fopen("record", "a+")) == NULL) return -1;
  flock(record_fp->_fileno, LOCK_EX);

  if (fseek(record_fp, 0, SEEK_END) != 0) return -1;
  fwrite("*****\n", 1, 6, record_fp);
  if (ferror(record_fp)) return -1;
  fwrite(key, 1, strlen(key), record_fp);
  if (ferror(record_fp)) return -1;
  fwrite("\n", 1, 1, record_fp);
  if (ferror(record_fp)) return -1;
  fwrite(value, 1, strlen(value), record_fp);
  if (ferror(record_fp)) return -1;
  fwrite("\n", 1, 1, record_fp);
  if (ferror(record_fp)) return -1;
  fwrite("-----\n", 1, 6, record_fp);
  if (ferror(record_fp)) return -1;

  fsync(fd);
  flock(fd, LOCK_UN);
  if (fclose(record_fp) != 0) return -1;
  record_ready = 1;
/* record a log over */

  // static char _key[1 << 20], _value[1 << 20];
  // ret = fseek(db->fp, 0, SEEK_SET); if (ret == -1) return -1;
  // while (1) {
  //   if (!fgets(_key, sizeof(_key), db->fp)) break;
  //   _key[strlen(_key) - 1] = '\0';
  //   if (strcmp(key, _key) == 0) {
  //     if (!fgets(_value, sizeof(_value), db->fp)) return -1;
  //     _value[strlen(_value) - 1] = '\0';
  //     ret = fseek(db->fp, -strlen(key)-1-strlen(_value)-1, SEEK_CUR);
  //     if (ret == -1) return -1;
  //     for (int i = 0; i < strlen(_key); ++i) {
  //       fwrite("\0", 1, 1, db->fp);
  //       if (ferror(db->fp)) {if (record_ready) recover(db); return -1;}
  //     }
  //     fwrite("\n", 1, 1, db->fp);
  //     if (ferror(db->fp)) {if (record_ready) recover(db); return -1;}
  //     for (int i = 0; i < strlen(_value); ++i) {
  //       fwrite("\0", 1, 1, db->fp);
  //       if (ferror(db->fp)) {if (record_ready) recover(db); return -1;}
  //     }
  //     fwrite("\n", 1, 1, db->fp);
  //     if (ferror(db->fp)) {if (record_ready) recover(db); return -1;}
  //   }
  // }

  ret = fseek(db->fp, 0, SEEK_END);
  if (ret == -1) return -1;
  fwrite(key,   1, strlen(key),   db->fp);
  if (ferror(db->fp)) {if (record_ready) recover(db); return -1;}
  fwrite("\n",  1, 1,             db->fp);
  if (ferror(db->fp)) {if (record_ready) recover(db); return -1;}
  fwrite(value, 1, strlen(value), db->fp);
  if (ferror(db->fp)) {if (record_ready) recover(db); return -1;}
  fwrite("\n",  1, 1,             db->fp);
  if (ferror(db->fp)) {if (record_ready) recover(db); return -1;}

  fsync(fd);
  flock(fd, LOCK_UN);
  pthread_mutex_unlock(&(db->mutex));
  return 0;
}

void see_all(kvdb_t *db) {
  fseek(db->fp, 0, SEEK_SET);
  static char _key[1 << 20];
  while (1) {
    if (!fgets(_key, sizeof(_key), db->fp)) break;
    _key[strlen(_key) - 1] = '\0';
    printf("%s\n", _key);
  }
}