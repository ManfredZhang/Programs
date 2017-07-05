#include <iostream>
using namespace std;

int main()
{
	
//输入题目
	int sudoku[3][3];

	for (int i = 0; i < 3; ++i)
	{
		for (int j = 0; j < 3; ++j)
		{
			cin >> sudoku[i][j];
		}
	}

//初始化矩阵模板
	int i,j,n,m,p,q;
	
	int matrix[27][27];
	//全设0
	for (int i = 0; i < 27; ++i)
	{
		for (int j = 0; j < 27; ++j)
		{
			matrix[i][j] = 0;
		}
	}

	//布置1：位置唯一性
	for (int n = 0; n < 3; ++n)
	{
		j = 0;
		for (int i = 9*n; i < 9*(n+1); ++i)
		{
			matrix[i][j] = 1;
			j++;
		}	
		
	}

	//布置1：行限制
	for (int n = 0; n < 9; ++n)
	{

		j = 9 + n;
		for (int i = 3*n; i < 3*(n+1); ++i)
		{
			matrix[i][j] = 1;
			
		}	
		
	}

	//布置1：列限制
	for (int n = 0; n < 9; ++n)
	{
		m = n/3;
		j = 18 + 3*m;
		for (int i = 3*n; i < 3*(n+1); ++i)
		{
			matrix[i][j] = 1;
			j++;
		}	
		
	}

//初始化矩阵go
	int matrixgo[27][27];
	//全设0
	for (int i = 0; i < 27; ++i)
	{
		for (int j = 0; j < 27; ++j)
		{
			matrixgo[i][j] = 0;
		}
	}

	//布置1：位置唯一性
	for (int n = 0; n < 3; ++n)
	{
		j = 0;
		for (int i = 9*n; i < 9*(n+1); ++i)
		{
			matrixgo[i][j] = 1;
			j++;
		}	
		
	}

	//布置1：行限制
	for (int n = 0; n < 9; ++n)
	{

		j = 9 + n;
		for (int i = 3*n; i < 3*(n+1); ++i)
		{
			matrixgo[i][j] = 1;
			
		}	
		
	}

	//布置1：列限制
	for (int n = 0; n < 9; ++n)
	{
		m = n/3;
		j = 18 + 3*m;
		for (int i = 3*n; i < 3*(n+1); ++i)
		{
			matrixgo[i][j] = 1;
			j++;
		}	
		
	}	
	
//将已知数从矩阵go中划去"输入1"
	for (int x = 0; x < 3; ++x)
	{
		for (int y = 0; y < 3; ++y)
		{
			if(sudoku[x][y] == 1)
			{	
				for (int i = 0; i < 27; ++i)
				{
					matrixgo[3*x+y][i] = 0;

					if(matrix[3*x+y][i] == 1)
					{
						for (int j = 0; j < 27; ++j)
						{
							if(matrix[j][i] == 1)
								for (int k = 0; k < 27; ++k)
								{
									matrixgo[j][k] = 0;
								}
						}
					}
				}
			}	
		}
	}

//将已知数从矩阵go中划去"输入2"
	for (int x = 0; x < 3; ++x)
	{
		for (int y = 0; y < 3; ++y)
		{
			if(sudoku[x][y] == 2)
			{	
				for (int i = 0; i < 27; ++i)
				{
					matrixgo[9+3*x+y][i] = 0;

					if(matrix[9+3*x+y][i] == 1)
					{
						for (int j = 0; j < 27; ++j)
						{
							if(matrix[j][i] == 1)
								for (int k = 0; k < 27; ++k)
								{
									matrixgo[j][k] = 0;
								}
						}
					}
				}
			}	
		}
	}

//将已知数从矩阵go中划去"输入3"
	for (int x = 0; x < 3; ++x)
	{
		for (int y = 0; y < 3; ++y)
		{
			if(sudoku[x][y] == 3)
			{	
				for (int i = 0; i < 27; ++i)
				{
					matrixgo[18+3*x+y][i] = 0;

					if(matrix[18+3*x+y][i] == 1)
					{
						for (int j = 0; j < 27; ++j)
						{
							if(matrix[j][i] == 1)
								for (int k = 0; k < 27; ++k)
								{
									matrixgo[j][k] = 0;
								}
						}
					}
				}
			}	
		}
	}

//将解填入原题目
	int number;
	for (int i = 0; i < 27; ++i)
	{
		for (int j = 0; j < 9; ++j)
		{
			if(matrixgo[i][j] == 1)
			{
				if(0<=i && i<9)
					number = 1;
				if(9<=i && i<18)
					number = 2;
				if(18<=i && i<27)
					number = 3;

				sudoku[j/3][j%3] = number;
			}
		}
	}

//输出矩阵go
	cout << "=========================================================" << endl;

	for (int i = 0; i < 27; ++i)
	{
		for (int j = 0; j < 27; ++j)
		{
			cout << matrixgo[i][j] << " ";
			if ((j+1)%9 == 0 && j != 26)
			{
				cout << "|" << " ";
			}
		}
		cout << endl;
		if((i+1)%9 == 0 && i != 26)
			cout << "---------------------------------------------------------"<< endl;
	}

	cout << "=========================================================" << endl;

//输出数独
	for (int i = 0; i < 3; ++i)
	{
		for (int j = 0; j < 3; ++j)
		{
			cout << sudoku[i][j] << " ";
		}
		cout << endl;
	}

return 0;
}