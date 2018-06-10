#include "kvdb.h"
#include <stdlib.h>
#include <assert.h>
#include <stdio.h>
#include <pthread.h>
#include <string.h>
#include <sys/types.h>
#include <unistd.h>

pthread_t ntid[50];
kvdb_t db;

void *plugandsee(void* vv) {
	
	kvdb_open(&db, "a.db");
	const char *key = "keya";
	kvdb_put(&db, key, (char*)vv);
	char *value = kvdb_get(&db, key);
	printf("[%s]: [%s]\n", key, value);
	free(value);
	see_all(&db);	
	fclose(db.fp);
	return ((void*)0);
}

void *plugandsee2(void* vv) {
	
	kvdb_open(&db, "a.db");
	const char *key = "keyb";
	kvdb_put(&db, key, (char*)vv);
	char *value = kvdb_get(&db, key);
	printf("[%s]: [%s]\n", key, value);
	free(value);
	see_all(&db);	
	fclose(db.fp);
	return ((void*)0);
}

int main() {

  int check = system("rm ./a.db"); if (check == 0) check++;
  check = system("rm ./record"); if (check == 0) check++;
  
  int count = 0;
  
  pthread_create(&ntid[count++], NULL, plugandsee, ((void*)"aaaaaaa"));
  sleep(1);
  printf("\n");
  pthread_create(&ntid[count++], NULL, plugandsee2, ((void*)"bbbbbbbb"));
  sleep(1);
  printf("\n");
  pthread_create(&ntid[count++], NULL, plugandsee2, ((void*)"cccccccc"));
  sleep(1);
  printf("\n");
  pthread_create(&ntid[count++], NULL, plugandsee, ((void*)"ddddddddd"));
  sleep(1);

	// kvdb_open(&db, "a.db");
	// char *key = "operaystems";
	// kvdb_put(&db, key, "aaaaaaa");
	// char *keyy = "adddddd";
	// kvdb_put(&db, keyy, "bbbbbbbb");
	// kvdb_put(&db, key, "cccccccc");
	// see_all(&db);
	// char *value = kvdb_get(&db, key);
	// printf("[%s]: [%s]\n", key, value);
	// free(value);

  return 0;
}