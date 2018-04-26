#include <stdio.h>
#include <assert.h>
#include <stdlib.h>
#include <unistd.h>
#include <string.h>
#include <fcntl.h>
#include <sys/types.h>
#include <sys/wait.h>
#include <regex.h>

regex_t re[2];
char pattern1[50] = "[a-zA-Z_]+[a-zA-Z]*[0-9]*[\(]";
char pattern2[50] = "[0-9]+[.][0-9]+";
char result[10000];
struct {
	char name[81];
	double time;
}All[81];
int syscall_count = 0;
char thisname[20];
double thistime;
double all_time = 0.0;

void final() {
	for (int i = 0; i < syscall_count; i++)
		all_time += All[i].time;
	for (int i = 0; i < syscall_count; i++) {
		for (int j = 0; j < syscall_count; j++) {
			if (All[i].time > All[j].time) {
				double tempd = All[i].time;
				All[i].time = All[j].time;
				All[j].time = tempd;
				char tempc[81];
				strcpy(tempc, All[i].name);
				strcpy(All[i].name,All[j].name);
				strcpy(All[j].name,tempc);
			}
		}
	}
	for (int i = 0; i < syscall_count; i++)
		printf("%20s: %lf%%\n",All[i].name, All[i].time/all_time*100);
}

int mysystem(char* cmdstring, char* aug, char buf[200000], int len)
{
	int fd[2]; 
	int pid;
	memset(buf,0,len);
	//float pc[100];
	//char name[100][100];


	if (pipe(fd) < 0) return -1;
	pid = fork();


	if (pid > 0) {    /* parent process */
		//wait(NULL);
		close(fd[1]);
		dup2(fd[0], STDIN_FILENO);
		int p = 0;
		regmatch_t pmatch;
		int cc = 0;
		while (fgets(buf, len, stdin) != NULL) {
			cc++;
			p = 0;
			int flag = 0;
			while (1) {
				for (int i = 0; i < 2; i++) {
					if (regexec(&re[i], buf + p, 1, &pmatch, 0) == 0 && pmatch.rm_so == 0) {
						int substr_len = pmatch.rm_eo;
						char tmp[100];
						for (int j = 0; j < substr_len; j++)
							tmp[j] = buf[p+j];
						if (i == 0) {
							tmp[substr_len-1] = '\0';
							strcpy(thisname, tmp);
							//printf("This name = %20s", thisname);
						}
						else {
							sscanf(tmp, "%lf", &thistime);
							//printf(" with time %lf\n", thistime);
							flag = 1;
						}
						p += substr_len;
					}	
				}
			
				for (int i = 0; i <= syscall_count; i++) {
					if (!strcmp(thisname, All[i].name)) {
						All[i].time += thistime;
						break;
					}
					else if (i == syscall_count) {
						strcpy(All[i].name, thisname);
						All[i].time += thistime;
						syscall_count++;
						break;
					}
				}

				if (flag == 1)
					break;
				else
					p++;
			}
			if (cc == 15000) {
				cc = 0;
				final();
				for (int i = 0; i < 81; i++) {
					memset(All[i].name, 0, sizeof(All[i].name));
					All[i].time = 0.0;
					syscall_count = 0;
					all_time = 0;
				}
				printf("\n\n");
			}

		}
	}


	else    /* child process, managed by parent process*/
	{
		close(fd[0]);
		if(!dup2(fd[1], STDERR_FILENO)) return -1;
		int null = open("/dev/null", O_WRONLY | O_APPEND);
		dup2(null, STDOUT_FILENO);
		execl("/usr/bin/strace", "strace", "-T", cmdstring, aug, (char*)0);
	}

	return 0;
}

int main(int argc, char *argv[]) {
	for (int i = 0; i < argc; i++) {
		assert(argv[i]);
		//printf("argv[%d] = %s\n", i, argv[i]);
	}
	char *cmdstring = argv[0];
	char *aug = argv[0];
	if (argv[1]) {cmdstring = argv[1]; aug = NULL;}
	if (argv[2]) aug = argv[2];
	if (!argv[1]) {printf("Usage: perf cmd aug\n"); exit(0);}
	char output[200000];
	int len = 200000;

	if (regcomp(&re[0], pattern1, REG_EXTENDED) != 0)
		perror("reg1comp==0");
	if (regcomp(&re[1], pattern2, REG_EXTENDED) != 0)
		perror("reg2comp==0");

	for (int i = 0; i < 81; i++) {
		memset(All[i].name, 0, sizeof(All[i].name));
		All[i].time = 0.0;
	}


	mysystem(cmdstring, aug, output, len);
	
	final();
	//printf("\nalltime = %lf\n",all_time);
	//printf("%s",output);

	return 0;
}
