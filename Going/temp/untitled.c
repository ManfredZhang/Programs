#include <stdio.h>

int is_perfect(int);

int main()
{
	int count = 0;
	int perfect5[5];
	int num = 1;
	while (count != 4)
	{
		if (is_perfect(num))
			perfect5[count++] = num;
		num++;
	}
	for (int i = 0; i < 4; ++i)
		printf("%d ", perfect5[i]);

	return 0;
}

int is_perfect(int a)
{
	int sum = 0;
	for (int i = 1; i < a; ++i)
	{
		if (a % i == 0)
			sum += i;
	}

	if(sum == a)
		return 1;
	else
		return 0;
}