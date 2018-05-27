#include <stdio.h>

int main() {
	char all[50];
	char a[10]= "hello";
	char b[10]= "kkk";
	sprintf(all,"%s ok %s",a,b);
	printf("%s\n",all);
	return 0;
}