#include <stdio.h>
#include <assert.h>
#include <stdlib.h>

struct node {
	int pid;
	int ppid;
	char name[81];
	int level;
	int children[10000];
	int childnum;
}process[10000];

void name_and_num_print_node(int PID) {
	if (process[PID].level != 0) {
		for (int i = 0; i < process[PID].level-1; i++)
			printf("          ");
		printf("└--------");
	}
	printf("%d %s\n",process[PID].pid,process[PID].name);
	process[PID].pid = 0;
	for (int i = 0; i < process[PID].childnum; i++)
		name_and_num_print_node(process[PID].children[i]);
}

void num_print_node(int PID) {
	if (process[PID].level != 0) {
		for (int i = 0; i < process[PID].level-1; i++)
			printf("          ");
		printf("└--------");
	}
	printf("%d\n",process[PID].pid);
	process[PID].pid = 0;
	for (int i = 0; i < process[PID].childnum; i++)
		num_print_node(process[PID].children[i]);
}


int main(int argc, char *argv[]) {
	for (int i = 0; i < 10000; i++) {
		process[i].pid = 0;
		process[i].level = 0;
		process[i].childnum = 0;
		for (int j = 0; j < 10000; j++)
			process[i].children[j] = 0;
	}

	int i;
	for (i = 0; i < argc; i++) {
		assert(argv[i]); // specification
		//printf("argv[%d] = %s\n", i, argv[i]);
	}
	assert(!argv[argc]); // specification

	for (int PID = 0; PID < 10000; PID++) {

		//char* filename = "/proc/1477/status";
		char filename[81];
		char* proc = "/proc/";
		char* status = "/status";
		//int PID = 1477;
		sprintf(filename,"%s%d%s",proc,PID,status);
	
		char Name[81];
		char Umask[81];
		char State[81];
		char Tgid[81];
		char Ngid[81];
		char Pid[81];
		char PPid[81];
		char* check;

		FILE *fp = fopen(filename, "r");

		if (fp) {
			check = fgets(Name,81,fp);
			check = fgets(Umask,81,fp);
			check = fgets(State,81,fp);
			check = fgets(Tgid,81,fp);
			check = fgets(Ngid,81,fp);
			check = fgets(Pid,81,fp);
			check = fgets(PPid,81,fp);
		
			char name[81];
			char buf[81];
			char Cpid[81];
			char Cppid[81];
			if (check) {
				sscanf(Name,"%s %s", buf, name);
				sscanf(Pid,"%s %s", buf, Cpid);
				sscanf(PPid,"%s %s", buf, Cppid);
			}
			
			int pid = atoi(Cpid);
			int ppid = atoi(Cppid);

			process[PID].pid = pid;
			process[PID].ppid = ppid;
			for (int i = 0; i < 81; i++)
				process[PID].name[i] = name[i];
			
			//printf("%d %d %s\n", process[PID].pid, process[PID].ppid, process[PID].name);

			fclose(fp);
		} else {
			continue;
		}
	}

	for (int PID = 0; PID < 10000; PID++) {
		if (process[PID].pid == 0) continue;
		if (process[PID].ppid == 0) continue;
		
		// maintain children, childnum
		int cur_ppid = process[PID].ppid;
		int ppid_childnum = process[cur_ppid].childnum;
		process[cur_ppid].children[ppid_childnum] = PID;
		process[cur_ppid].childnum++;
	
		// maintain level
		int temp = PID;
		while (process[temp].ppid != 0) {
			process[PID].level++;
			temp = process[temp].ppid;
		}
	}

	if (argv[1]) {	
		if (argv[1][1] == 'p') {
			for (int PID = 0; PID < 10000; PID++) {
				if (process[PID].pid == 0) continue;
				num_print_node(PID);
			}
		}
		else if (argv[1][1] == 'V') {
			printf("Version: 1.0\n");
		}
		else {
			for (int PID = 0; PID < 10000; PID++) {
				if (process[PID].pid == 0) continue;
				name_and_num_print_node(PID);
			}
		}
	}
	else {	
		for (int PID = 0; PID < 10000; PID++) {
			if (process[PID].pid == 0) continue;
			name_and_num_print_node(PID);
		}
	}




	return 0;
}
