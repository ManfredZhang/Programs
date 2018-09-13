#include <iostream>
using namespace std;
int main()
{
	//宫限制
	int j = 0;

	int matrix[729][81];
	//全设0
	for (int i = 0; i < 729; ++i)
	{
		for (int j = 0; j < 81; ++j)
		{
			matrix[i][j] = 0;
		}
	}


	for (int n = 0; n < 27 ; ++n)
	{
		for (int m = 3*n; m < 3*(n+1); ++m)
		{
			for (int o = 3*m; o < 3*(m+1); ++o)
			{
				for (int i = 3*o; i < 3*(o+1); ++i)
				{
					matrix[i][j] = 1;
				}
				j = j + 1;	
			}
			j = j - 3;
		}	
		j = j + 3;
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