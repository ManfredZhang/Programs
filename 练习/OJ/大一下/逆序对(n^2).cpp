#include <iostream>
using namespace std;
int main()
{
	int num;
	cin >> num;

	int *array = new int[num];
	for (int i = 0; i < num; ++i)
	{
		cin >> array[i];
	}

	int count = 0;

	for (int i = 0; i < num; ++i)
	{
		for (int j = i; j < num; ++j)
		{
			if (array[j] < array[i])
				count++;
		}
	}

	cout << count << endl;

	return 0;

}