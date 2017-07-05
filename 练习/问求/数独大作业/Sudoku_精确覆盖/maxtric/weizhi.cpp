#include <iostream>
using namespace std;
int main()
{
	int j;

	int matrix[729][81];
	//全设0
	for (int i = 0; i < 729; ++i)
	{
		for (int j = 0; j < 81; ++j)
		{
			matrix[i][j] = 0;
		}
	}


	//布置：位置唯一性
	for (int n = 0; n < 9; ++n)
	{
		j = 0;
		for (int i = 81*n; i < 81*(n+1); ++i)
		{
			matrix[i][j] = 1;
			j++;
		}		
	}


	for (int i = 0; i < 729; ++i)
	{
		for (int j = 0; j < 81; ++j)
		{
			cout << matrix[i][j] << " ";
			if ((j+1)%9 == 0 && j != 80)
			{
				cout << " ";
			}
		}
		cout << endl;
		if((i+1)%9 == 0 && i != 728)
			cout << endl;
	}
	return 0;
}