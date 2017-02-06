#include <iostream>
using namespace std;

int max(int a,int b)
{
	return (a>b? a:b);
}

int main()
{
	int (*p)(int,int);
	p = max;
	cout << max(1,3) << endl;
	cout << p(2,4) << endl;

	return 0;
}