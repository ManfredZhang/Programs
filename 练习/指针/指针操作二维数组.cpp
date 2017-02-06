#include <iostream>
using namespace std;
int main()
{
	int a[2][3];
	int k = 0;
	for (int i = 0; i < 2; ++i)
	{
		for (int j = 0; j < 3; ++j)
		{
			a[i][j] = ++k;
		}
	}
	
/*	
	//一级指针变量可以存储数组b某一元素的地址

	int *p;
	p = a[0];
	
	for (int i = 0; i < 6; ++i)
	{
		cout << p[i] << " ";
	}
	cout << endl;
	//p = a[0];
	for (int i = 0; i < 6; ++i)
	{
		cout << *(p+i) << " ";
	}
	cout << endl;





	//二级指针变量可以存储数组b某一行的地址

	int (*q)[3];
	q = &a[0];
	
	//下标法
	for (int i = 0; i < 2; ++i)
	{
		for (int j = 0; j < 3; ++j)
		{
			cout << (q[i])[j] << " ";
			//aka.cout << a[0][0];
		}
	}
	cout << endl;

	//偏移量法
	for (int i = 0; i < 2; ++i)
	{
		for (int j = 0; j < 3; ++j)
		{
			cout << *(*(q+i)+j) << " ";
		}
	}
	cout << endl;
	for (int i = 0; i < 2; ++i)
	{
		for (int j = 0; j < 3; ++j)
		{
			cout << *(&q[0][0]+3*i+j) << " ";
		}
	}
	cout << endl;

	for (int i = 0; i < 2; ++i)
	{
		for (int j = 0; j < 3; ++j)
		{
			cout << (*(q+i))[j] << " ";
		}
	}
	cout << endl;
*/


	//三级指针变量可以存储整个数组b的地址

	int (*r)[2][3];
	r = &a;
	cout << *(*((*r)+1)+2) << endl;
	cout << (*r)[1][2] << endl;
	cout << 

	return 0;
}