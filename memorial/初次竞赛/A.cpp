#include <iostream>
#include <cstdio>

using namespace std;


int main()
{
	int times;
	scanf("%d", &times);

	for (int l = 0; l < times; l++)
	{
		int num;
		scanf("%d", &num);
		int *a = new int[num];
		for (int i = 0; i < num; i++)
			scanf("%d", &a[i]);

		int *b = new int[num + 1];
		for (int i = 0; i < num + 1; i++)
		{
			b[i] = 0;
		}

		for (int i = 0; i < num; i++)
		{
			b[a[i]]++;
		}


		int max = 1;
		for (int i = 0; i < num; i++)
		{
			if (b[i] > max)
				max = i;
		}

		printf("%d", max);




	}

	return 0;
}