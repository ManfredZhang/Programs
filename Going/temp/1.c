#include <stdio.h>
#include <stdlib.h>

float* bsort(float *p, int any_length)
{
	for (int i = 0; i < any_length; ++i)
	{
		for (int j = i; j < any_length; ++j)
		{
			if (p[i] > p[j])
			{
				float temp = p[i];
				p[i] = p[j];
				p[j] = temp;
			}
		}
	}
	return p;
}

int main()
{
	int any_length;
	scanf("%d", &any_length);
	float *p = malloc(sizeof(float) * any_length);

	float num;
	for (int i = 0; i < any_length; ++i)
	{
		scanf("%f", &num);
		p[i] = num;
	}

	bsort(p, any_length);

	for (int i = 0; i < any_length; ++i)
	{
		printf("%f\n", p[i]);
	}
	return 0;
}