#include <stdio.h>
#include <stdlib.h>

int main()
{
	int num;
	scanf("%d", &num);
	char s[10];
	int mod = 10;
	int count = 0;

	/*while(num != 0)
	{
		s[count++] = (num % mod) - '0'; 
		num /= mod;
		mod *= 10;
	}*/

	s[0] = (num % mod) - '0';
	printf("%c\n", s[0]);

	return 0;
}