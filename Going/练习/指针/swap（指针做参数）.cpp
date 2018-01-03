#include <iostream>
using namespace std;

void swap(int *p, int *q)
{
	int temp;
	temp = *p;
	*p = *q;
	*q = temp;
}
void swap2(int *p,int *q)
{
	int *temp;
	temp = p;
	p = q;
	q = temp;
}
void swap3(int **p,int **q)
{
	int *temp;
	temp = *p;
	*p = *q;
	*q = temp;
}

int main()
{

	int a = 1;
	int b = 2;
	swap(&a,&b);

	cout << a << b << endl;

	swap2(&a,&b);//改变形参对实参无影响

	cout << a << b << endl;

	int *p = &a;
	int *q = &b;
	swap3(&p,&q);

	cout << *p << *q << endl;

	return 0;
}

/*	主函数中“swap2(&a,&b);”表示把a和b的地址复制，
	并把其副本传入void swap2函数进行操作，地址的副本不会影响a和b的真实地址；

	而主函数中“swap(&a,&b);”和“swap3(&a,&b);”虽也是表示把a和b地址的副本
	传入void swap/swap3函数中，但其子函数中用的”*“（取值操作），
	即使那是地址的副本，也可以从假副本中取到真值
	（3中假地址是”a/b地址的地址“，其取到的就是真地址,可以同过交换真地址达成目标）
*/












