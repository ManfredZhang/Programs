#include <iostream>

using namespace std;

int main()
{


//初始化矩阵模板
	int i,j,n,m,p,q;
	
	int matrix[729][324];
	//全设0
	for (int i = 0; i < 729; ++i)
	{
		for (int j = 0; j < 324; ++j)
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

	//布置：行限制
	for (int n = 0; n < 81; ++n)
	{

		j = 81 + n;
		for (int i = 9*n; i < 9*(n+1); ++i)
		{
			matrix[i][j] = 1;	
		}	
	}

	//布置：列限制
	for (int n = 0; n < 81; ++n)
	{
		m = n/9;
		j = 162 + 9*m;
		for (int i = 9*n; i < 9*(n+1); ++i)
		{
			matrix[i][j] = 1;
			j++;
		}		
	}

	//布置：宫限制
	j = 243;
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
		for (int j = 0; j < 324; ++j)
		{
			cout << matrix[i][j] << " ";
			if ((j+1)%9 == 0 && j != 323)
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


