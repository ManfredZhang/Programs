#include <iostream>
using namespace std;
int main()
{
	int row;
	int column;
	int stage[1000][1000];
	int count = 0;
	cin >> row >> column;

//输入舞台现状
	for (int i = 0; i < row; ++i)
	{
		for (int j = 0; j < column; ++j)
		{
			cin >> stage[i][j];
		}
	}

//在舞台每个空位置的前后左右方向找1，找着就计数
	for (int i = 0; i < row; ++i)
	{
		for (int j = 0; j < column; ++j)
		{
			if (stage[i][j] == 0)
			{
				bool row_ok = false;
				for (int p = 0; p < j; ++p)
				{
					if (stage[i][p] == 1)
					{
						row_ok = true;
						break;
					}
				}
				if (row_ok == true)
				{
					count++;
				}

				row_ok = false;
				for (int p = j; p < column; ++p)
				{
					if (stage[i][p] == 1)
					{
						row_ok = true;
						break;
					}
				}
				if (row_ok == true)
				{
					count++;
				}

				bool column_ok = false;
				for (int q = 0; q < i; ++q)
				{
					if (stage[q][j] == 1)
					{
						column_ok = true;
						break;
					}
				}
				if (column_ok == true)
				{
					count++;
				}

				column_ok = false;
				for (int q = i; q < row; ++q)
				{
					if (stage[q][j] == 1)
					{
						column_ok = true;
						break;
					}
				}
				if (column_ok == true)
				{
					count++;
				}
				
			}
		}
	}

//输出结果
	cout << count << endl;

	


	return 0;
}
