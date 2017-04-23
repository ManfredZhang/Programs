//题目实质：获胜城市数目变不了，要通过合并减少总城市数
//WA：两个城市都输也要合并，以减少总城市数



#include <iostream>
#include <cstdio>
#include <vector>
using namespace std;


int main()
{
	int times;
	scanf("%d", &times);

	int *swap = new int[times];
	vector<int> swaparray;

	for (int i = 0; i < times; i++)
	{
		swap[i] = 0;
	}

	for (int t = 0; t < times; t++)
	{
		int city;
		scanf("%d", &city);
		int *cat = new int[city];
		int *dog = new int[city];
		for (int i = 0; i < city; i++)
		{
			scanf("%d", &cat[i]);
			scanf("%d", &dog[i]);
		}
		int count = 0;

		for (int i = 0; i < city; i++)
		{
			if (cat[i] > dog[i])
				count++;
		}

		
		for (int i = 0; i < city ; i++)
		{
			if (cat[i] + cat[i + 1] > dog[i] + dog[i + 1] && cat[i] < dog[i])
			{
				i++;
				//count++;
				city--;
				swaparray.push_back(i);
				swap[t]++;
			}
			else if (cat[i] + cat[i + 1] > dog[i] + dog[i + 1] && cat[i+1] < dog[i+1])
			{
				i++;
				//count++;
				city--;
				swaparray.push_back(i);
				swap[t]++;
			}

		}
	
		if (count <= city / 2)
			swap[t] = -1;
		
	}

	int x = 0;
	for (int i = 0; i < times; i++)
	{
		printf("%d", swap[i]);
		if (i != times - 1 || (swap[i] != 0 && swap[i] != -1))
			cout << endl;
		for (int j = x; j < x+swap[i]; j++)
		{
			printf("%d %d", swaparray[j],swaparray[j]+1);
			if (j != swaparray.size())
				cout << endl;
		}
		x += swap[i];

	}
	


	return 0;
}