#include <iostream>
using namespace std;
int main()
{
	int n = 0;
	const double pi = 3.1415926;
	
	cout << pi << endl;

	const int *p1 = &n;//*p1的值不可以改变
	int * const p2 = &n;//p2的值不可以改变
	const int * const p3 = &n;//*p3和p3的值都不能改变

	//int * const p4 = &pi; 过不了编译，以防止通过p4修改pi的值
	//(任何指针不得指向pi)

	return 0;
}