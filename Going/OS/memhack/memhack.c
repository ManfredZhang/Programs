#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/ptrace.h>
#include <sys/types.h>
#include <sys/wait.h>
#include <sys/types.h>
#include <regex.h>
#include <ctype.h>


char command[10];
int pid;
void *addr = NULL;
void *data = NULL;
int ret_val = 0;
int is_tracking = 0;
int total_addr_begin, total_addr_end;
int target_addr_begin, target_addr_end;
int not_first_lookup = 0;
int can_set = 0;
int the_addr = 0xcd;

void init_addr() {
	// open the map file
	char full_path[128];
	sprintf(full_path,"/proc/%d/maps",pid);
	FILE *fp = fopen(full_path, "r");
	if (fp == NULL) {printf("Can't open pid's map\n");exit(0);}

	// init the regex pattern
	regex_t reg_rw, reg_heap;
	regmatch_t pmatch;
	char *pattern_rw = "rw-p";
	char *pattern_heap = "heap";
	regcomp(&reg_rw, pattern_rw, REG_EXTENDED);
  regcomp(&reg_heap, pattern_heap, REG_EXTENDED);

  // search for the addr begin and end
  char buf[1024];
  while (fgets(buf, 1024, fp) != NULL) {
		if (regexec(&reg_heap, buf, 1, &pmatch, 0) == 0) break;
		if (regexec(&reg_rw, buf, 1, &pmatch, 0) == 0) {
	  	char begin_char[48]; int b = 0;
	  	char end_char[48]; int e = 0;
	  	int i = 0;
	  	while (buf[i] != '-') begin_char[b++] = buf[i++];
	  	begin_char[b] = '\0'; i++;
	  	while (buf[i] != ' ') end_char[e++] = buf[i++];
	  	end_char[e] = '\0';
	  	
      sscanf(begin_char, "%x", &total_addr_begin);
      sscanf(end_char, "%x", &total_addr_end);
	  }
  }

  target_addr_begin = total_addr_begin;
  target_addr_end = total_addr_end;

  regfree(&reg_rw);
  regfree(&reg_heap);
  fclose(fp);
}

void look_up(int data_search) {
	int target_addr_pool[1024];
	int filtered_addr_pool[1024];
	int target_fish_num = 0;
	int filtered_fish_num = 0; 
	int data_get = 0;

	// this time searching get target pool addr
	for (int cur_addr = target_addr_begin; cur_addr < target_addr_end; cur_addr++) {
    data_get = ptrace(PTRACE_PEEKDATA, pid, cur_addr, NULL);
    if (data_get == data_search) {
      printf("find val == %d in cur_addr == %x\n", data_get, cur_addr);
      target_addr_pool[target_fish_num++] = cur_addr;
    }
  }

  // init filtered_addr_pool
  if (not_first_lookup == 0) {
  	for (int i = 0; i < target_fish_num; ++i)
  		filtered_addr_pool[i] = target_addr_pool[i];
  	filtered_fish_num = target_fish_num;
  }

  // filter
  if (not_first_lookup) {
  	for (int i = 0; i < filtered_fish_num; ++i) {
  		int valid = 0;
  		for (int j = 0; j < target_fish_num; ++j) {
  			if (target_addr_pool[j] == filtered_addr_pool[i])
  				valid = 1;
  		}
  		if (valid == 0) {
  			filtered_fish_num--;
  			filtered_addr_pool[i] = 0xcc;
  		}
  	}
  }

  if (filtered_fish_num - 1 == 1) {
  	can_set = 1;
  	printf("We can set the value now\n");
  }
  for (int i = 0; i < filtered_fish_num; ++i) {
  	if (filtered_addr_pool[i] != 0xcc)
  		the_addr = filtered_addr_pool[i];
  }

  not_first_lookup = 1;
}

void set_up(int data_set) {
	if (the_addr == 0xcd) {
		printf("We should lookup the addr first\n");
		return;
	}
  ptrace(PTRACE_POKEDATA, pid, the_addr, data_set);
  printf("DONE\n");
}


int main(int argc, char *argv[]) {
	memset(command, 0, sizeof(command));
	pid = atoi(argv[1]);

	init_addr();

	printf ("$$ ");
	while (scanf("%s",command) != EOF) {
		if (command[0] == 'e' && command[1] == 'x' && command[2] == 'i' && command[3] == 't')
			break;
		if (command[0] == 'p' && command[1] == 'a' && command[2] == 'u' && command[3] == 's' && command[4] == 'e') {
			// ptrace(enum request, pid_t pid, void *addr, void *data);
			ret_val = ptrace(PTRACE_ATTACH, pid, addr, data);
			if (ret_val == -1) {printf("Pause not allowed\n"); break;}
			is_tracking = 1;
			printf("PAUSE SUCCEED\n");
		}
		if (command[0] == 'r' && command[1] == 'e' && command[2] == 's' && command[3] == 'u' && command[4] == 'm' && command[5] == 'e') {
			if (is_tracking == 1) {
				ret_val = ptrace(PTRACE_DETACH, pid, addr, data);
				if (ret_val == -1) {printf("Resume not allowed\n"); break;}
			}
			is_tracking = 0;
			printf("RESUME SUCCEED\n");
		}
		if (command[0] == 'l' && command[1] == 'o' && command[2] == 'o' && command[3] == 'k' && command[4] == 'u' && command[5] == 'p') {
			int data_search;
			ret_val = scanf("%d", &data_search);
			if (ret_val != EOF)
				look_up(data_search);
		}
		if (command[0] == 's' && command[1] == 'e' && command[2] == 't' && command[3] == 'u' && command[4] == 'p') {
			int data_set;
			ret_val = scanf("%d", &data_set);
			if (ret_val != EOF)
				set_up(data_set);
		}

		memset(command, 0, sizeof(command));
		printf("$$ ");
	}
	return 0;
}
