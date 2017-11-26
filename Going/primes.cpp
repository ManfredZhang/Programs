#include <iostream>
using namespace std;
#define N 250

int main()
{
	int *num = new int[N];
	memset(num, 0, sizeof(int));

	for (int i = 2; i < N; i++)
	{
		if (num[i] == 0)
		{
			int temp = i;
			int times = 2;
			while (temp*times < N)
			{
				num[temp*times] = 1;
				times++;
			}
		}
	}

	for (int i = 1; i < N; i++)
	{
		if (num[i] == 0)
			cout << i << endl;
	}

	return 0;
}
	
