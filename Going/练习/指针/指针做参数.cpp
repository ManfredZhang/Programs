/*当函数的形参定义成指针变量，实参是数组名时，调用时不是将实参的副本通过
赋值的形式一一传递给 形参，而是通过指针变量直接访问实参，以提高数据的 “传递”效率。
这种函数调用方式通常叫做 !传址调用! 。*/


#include <iostream>
using namespace std;
int sum(int *p,int n);
int main()
{
	int a[3] = {1,5,3};
	cout << sum(a,3) << endl;
	return 0;
}
int sum(int *p,int n)
{
	int sum = 0;
	for (int i = 0; i < n; ++i)
	{
		sum += *(p+i);
	}
	return sum;
}