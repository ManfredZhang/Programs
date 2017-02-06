#include <iostream>
using namespace std;
int main()
{
	/*动态变量是指系统根据程序执行过程中的动态需求，
	临时在零星的空闲内存中寻找合适的若干单元来存储的一
	类数据*/

	int n = 2;
	int m = 3;

	int *a = new int;
	double *b = new double[n];
	int *c = new int[n*m];//二维数组
	//int *c = new int[n][m];错误

	for (int i = 0; i < n; ++i)
	{
		for (int j = 0; j < m; ++j)
		{
			//cin >> c[i][j];错误
			cin >> c[m*i+j];
		}
	}



	for (int i = 0; i < n; ++i)
	{
		for (int j = 0; j < m; ++j)
		{
			cout << c[m*i+j] << " ";
		}
		cout << endl;
	}
	
	delete a;
	delete []b;
	delete []c;

	return 0;
}