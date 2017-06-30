#include <iostream>
using namespace std;
int main()
{
	int in_num;
	cin >> in_num;

	int *wall = new int[in_num];
	for (int i = 0; i < in_num; ++i)
	{
		cin >> wall[i];
	}

	int max = wall[0];
	for (int i = 0; i < in_num; ++i)
	{
		if (wall[i] > max)
			max = wall[i];
	}

	int water = 0;
	int *flag = new int[in_num];
	while (max > 0)
	{
		int flagnum = 0;
		for (int i = 0; i < in_num; ++i)
		{
			if (wall[i] == max)
			{
				flag[flagnum] = i;
				flagnum++;
				wall[i]--;
			}
		}
		max--;

		for (int j = flagnum-1; j > 0; j--)
			water += flag[j] - flag[j-1] - 1;
	}

	cout << water << endl;

	delete []flag;

	return 0;
}