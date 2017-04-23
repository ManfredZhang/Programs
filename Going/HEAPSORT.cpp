#include <iostream>
using namespace std;

int PARENT(int i)
{
	return i / 2;
}

int LEFT_CHILD(int i)
{
	return 2 * i;
}

int RIGHT_CHILD(int i)
{
	return 2 * i + 1;
}

void swap(int &a, int &b)
{
	int temp;
	temp = b;
	b = a;
	a = temp;
}

void MAX_HEAPIFY(int *a, int n, int heapsize)
{
	int largest = 0;
	int l = LEFT_CHILD(n);
	int r = RIGHT_CHILD(n);
	if (l <= heapsize && a[l] > a[n])
		largest = l;
	else
		largest = n;
	if (r <= heapsize && a[r] > a[largest])
		largest = r;

	if (largest != n)
	{
		swap(a[n], a[largest]);
		MAX_HEAPIFY(a, largest, heapsize);
	}
}

void BUILD_MAX_HEAP(int *a, int heapsize)
{
	for (int i = heapsize / 2; i >= 1; i--)
		MAX_HEAPIFY(a, i, heapsize);
}

void HEAPSORT(int *a, int heapsize)
{
	BUILD_MAX_HEAP(a, heapsize);
	for (int i = heapsize; i >= 1; i--)
	{
		swap(a[heapsize], a[1]);
		heapsize--;
		MAX_HEAPIFY(a, 1, heapsize);
	}
}

int main()
{
	int heapsize;
	while (cin >> heapsize)
	{
		int *a = new int[heapsize + 1];
		a[0] = 0;
		for (int i = 1; i <= heapsize; i++)
			cin >> a[i];
		
		HEAPSORT(a, heapsize);

		for (int i = 1; i <= heapsize; i++)
		{
			cout << a[i];
			if (i != heapsize)
				cout << " ";
		}

		cout << endl;
	}

	return 0;
}
