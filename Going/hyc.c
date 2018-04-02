#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <string.h>
#include <ctype.h>
#include <dirent.h>

#define MAX_BUFFER_LEN 1024
#define MAX_PROC_NUM 100
#define MAX_NAME_LEN 50
#define MAX_TIME_LEN 20

typedef struct Global {
	int fd[2];
	char input_buf[MAX_BUFFER_LEN];
	int proc_num;
	char name[MAX_PROC_NUM][MAX_NAME_LEN];
	double time_double[MAX_PROC_NUM];
	double rate[MAX_PROC_NUM];
} Global;

Global g;

void Parse_Command(int argc, char *argv[]) {
	if (argc >= 2) {
		argv[0] = "strace";
		for (int i=argc;i>=2;i--){
			argv[i] = argv[i-1];
		}
		argv[1] = "-T";
		argv[argc + 1] = NULL;
		char * envp [] = {"PATH=/bin", NULL};
		close(g.fd[0]);
		if (dup2(g.fd[1], STDERR_FILENO) < 0){
			perror("dup2 create");
			exit(EXIT_FAILURE);
		}
		execve("/usr/bin/strace", argv, envp);
		perror("Fail to execve");
	}
}

void Parse_Strace(char *buf) {
	int i, buf_size = strlen(buf), time_char_begin, first_flag = 1;
	double time_val = 0.0;
	char temp_name[MAX_NAME_LEN];
	char temp_time_char[MAX_TIME_LEN];
	for (i = 0; i < buf_size; i++){
		if (g.input_buf[i] == '(')
			break;
		temp_name[i] = g.input_buf[i];
	}
	temp_name[i] = '\0';
	for (time_char_begin = buf_size-2; time_char_begin >= 0; time_char_begin --){
		if (g.input_buf[time_char_begin] == '<'){
			time_char_begin++;
			break;
		}
	}
	for (i = time_char_begin; i <= buf_size - 3; i++)
		temp_time_char[i-time_char_begin] = g.input_buf[i];
	if (strlen(temp_time_char) < 2) return;
//	printf("%s\t%s\n\n",temp_name, temp_time_char);
	time_val = atof(temp_time_char);
	for (i = 0; i < g.proc_num; i++){
		if (strcmp(temp_name, g.name[i]) == 0){
			g.time_double[i] += time_val;
			first_flag = 0;
			break;
		}
	}
	if (first_flag){
		strcpy(g.name[g.proc_num], temp_name);
		g.time_double[g.proc_num] = time_val;
		g.proc_num ++;
	}
}

void Swap(int i, int j){
	char temp_name[MAX_NAME_LEN];
	double temp_time_double, temp_rate;
	temp_time_double = g.time_double[i];
	temp_rate = g.rate[i];
	strcpy(temp_name, g.name[i]);
	g.time_double[i] = g.time_double[j];
	g.rate[i] = g.rate[j];
	strcpy(g.name[i], g.name[j]);
	g.time_double[j] = temp_time_double;
	g.rate[j] = temp_rate;
	strcpy(g.name[j], temp_name);
}

void Further_Calculate(){
	double sum = 0.0;
	int i, j;
	for (i = 0; i < g.proc_num; i++)
		sum += g.time_double[i];
	for (i = 0; i < g.proc_num; i++)
		g.rate[i] = g.time_double[i]/sum*100.0;
	for (i = 0; i < g.proc_num; i++)
		for (j = 0; j < g.proc_num; j++)
			if (g.rate[i] > g.rate[j])
				Swap(i, j);
	for (i = 0; i < g.proc_num; i++)
		printf("%s:%10.2lf%%\n", g.name[i], g.rate[i]);
}

int main(int argc, char *argv[]) {
	int fpid;
	g.proc_num = 0;
	if (pipe(g.fd) != 0) {
		perror("Fail to create a pipe.");		
		exit(EXIT_FAILURE);
	}
	fpid = fork();
	if (fpid < 0) {
		perror("Fail to fork.");
		exit(EXIT_FAILURE);
	}
	else if (fpid == 0) {
		Parse_Command(argc, argv);
	}
	else {
		close(g.fd[1]);
		dup2(g.fd[0], STDIN_FILENO);
		while (fgets(g.input_buf, sizeof(g.input_buf), stdin) != NULL)
			Parse_Strace(g.input_buf);
		Further_Calculate();
	}
	return 0;
}
