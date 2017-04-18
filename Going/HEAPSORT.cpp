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

void MAX_HEAPIFY(int *a, int n)
{

}

void BUILD_MAX_HEAP(int *a, int num)
{
	for (int i = num / 2; i >= 0; i++)
		MAX_HEAPIFY(a, i);
}

void HEAPSORT(int *a, int num)
{
	BUILD_MAX_HEAP(a, num);
	for (int i = num - 1; i > 0; i--)
	{
		swap(a[num - 1], a[0]);
		//num--;
		MAX_HEAPIFY(a, 0);
	}
}

int main()
{
	int num;
	cin >> num;
	int *a = new int[num];
	for (int i = 0; i < num; i++)
		cin >> a[i];
	
	HEAPSORT(a, num);

	for (int i = 0; i < num; i++)
	{
		cout << a[i];
		if (i != num - 1)
			cout << " ";
	}

	return 0;
}
