#include <iostream>
#include <cmath>
using namespace std;

typedef double (*go)(double);
go func_list[3] = {sin,cos,tan};
//double (*func_list[3])(double) = {sin,cos,tan};

int main()
{
	int index;
	double x;
	do
	{
		cout << "请输入要计算的函数(0:sin 1:cos 2:tan):\n";
		cin >> index;
	}
	while(index < 0 || index > 2);
	cout << "请输入参数:";
	cin >> x;
	cout << "结果为:" << func_list[index](x) << endl;

	return 0;
}