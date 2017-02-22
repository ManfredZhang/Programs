/*选择排序
输入 1 5 2 4 3
1
1 2
1 2 3
1 2 3 4
1 2 3 4 5
*/




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
	
	
	for (int i = 0; i < 5; ++i)
	{
		for (int j = 0; j < 5; ++j)
		{
			if (array[j] > array[i])
			{
				swap(array,i,j);
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
