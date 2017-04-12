#include <iostream>
using namespace std;

void swap(int &a, int &b)
{
	int temp;
	temp = a;
	a = b;
	b = temp;
}

int partition(int *array,int p,int r)
{
	int x = array[r];
	int i = p-1;
	for (int j = p; j < r; ++j)
	{
		if (array[j] < x)
		{
			swap(array[++i],array[j]);
		}
	}
	swap(array[++i],array[r]);
	return i;
}

void quicksort(int *array,int p,int r)
{
	int q;
	if (p < r)
	{
		q = partition(array,p,r);
		quicksort(array,p,q-1);
		quicksort(array,q+1,r);
	}
	else
		return;
}

int main()
{
	int num = 2;
	int *array = new int[num];

	while (cin >> num)
	{
		for (int i = 0; i < num; ++i)
			cin >> array[i];

		quicksort(array,0,num-1);

		for (int i = 0; i < num; ++i)
		{
			cout << array[i];
			if (i != num - 1)
			{
				cout << " ";
			}
		}
		cout << endl;
	}

	return 0;
}