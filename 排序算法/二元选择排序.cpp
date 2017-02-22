#include <iostream>
using namespace std;

void swap(int array[],int i,int j)
{
    int temp;
    temp = array[i];
    array[i] = array[j];
    array[j] = temp;
    return;
}

int main()
{
	int array[5];
	for (int i = 0; i < 5; ++i)
	{
		cin >> array[i];
	}

	for (int i = 0; i < 2; ++i)
	{
		for (int j = 0; j < 5; ++j)
		{
			if (array[j] > array[i])
			{
				swap(array,i,j);
			}

			if (array[j] < array[i])
			{
				swap(array,4-i,j);
			}
		}
	}

	for (int i = 0; i < 5; ++i)
	{
		cout << array[i]<< " ";
	}
	cout << endl;

	return 0;
}
