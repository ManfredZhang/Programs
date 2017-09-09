#include <stdio.h>
int main()
{
	int a=1;
	int b=0;
	for (int i = 0; i < 50; ++i){
		if (i%2==0){
			a=a+b;
			printf("%d\n",a);
		}
		else{ 
			b=a+b;
			printf("%d\n",b);
		}
	}
	
} 