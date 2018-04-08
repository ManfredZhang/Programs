#include <stdio.h>
#include <string.h>
#include <limits.h>
#include <assert.h>
#include <unistd.h>
#include <stdlib.h>
#include <time.h>
#include <dlfcn.h>


int main() {
	if(system("rm /tmp/func_*")) 
		printf("ignore that plz\n");
	printf("Let's begin!\n");
	char input[1000];
	int count = 0;
	while (fgets(input, sizeof(input), stdin) != NULL) {
		if (input[0] == 'i' && input[1] == 'n' && input[2] == 't' && input[3] == ' ') {
			FILE *fp = fopen("/tmp/func_all.c", "a+"); assert(fp != NULL);
			fputs(input, fp);
			fclose(fp);

			int check = system("gcc -shared -fPIC /tmp/func_all.c -o /tmp/func_all.so -ldl"); assert(check == 0);
		}
		else {
			int check;
			input[strlen(input)-1] = '\0';
			
			if (!access("/tmp/func_all.c", F_OK)) {
				check = system("cp /tmp/func_all.c /tmp/func_curall.c");
				// printf("been here\n");
				assert(check == 0);
			}

			FILE *fp = fopen("/tmp/func_curall.c", "a+"); assert(fp != NULL);

			char shortname[1000];
			char shortfunc[1000];
			sprintf(shortname, "__expr_wrap_%d", count);
			count++;
			sprintf(shortfunc, "int %s() {return %s;}", shortname, input);

			fputs(shortfunc, fp);
			fclose(fp);

			check = system("gcc -shared -fPIC /tmp/func_curall.c -o /tmp/func_curall.so -ldl"); assert(check == 0);

			void *handle = dlopen("/tmp/func_curall.so", RTLD_LAZY);
			assert(handle != NULL);
			
			int (*func_addr)() = dlsym(handle, shortname);
			assert(func_addr != NULL);

			printf(">> %s = %d.\n",input, (*func_addr)());

			dlclose(handle);
		}
	}
	return 0;
}
