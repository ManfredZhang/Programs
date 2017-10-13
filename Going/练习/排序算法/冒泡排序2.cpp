#include <iostream>
using namespace std;

void exchange(int* a, int* b)
{
	int c;
	c = *a;
	*a = *b;
	*b = c; 
}

int main()
{
	int a[5] = {5,4,3,2,1};

	for (int i = 0; i < 5; ++i)
	{
		for (int j = 5; j > i; --j)
		{
			if (a[j] < a[j-1])
			{
				exchange(&a[j],&a[j-1]);
				for (int i = 0; i < 5; ++i)
				{
					cout << a[i] << " ";
				}

				cout << endl;
			}
		}
		cout << "--第" << i+1 << " 次内循环完成--" << endl;
	}

	

	return 0;
}