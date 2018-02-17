#include <iostream>
using namespace std;

int fac(int n)
{
	if (n == 0)
		return 1;
	else
		return n * fac(n-1);
}

int haha(int(*p)(int x),int a,int b)
{
	return (*p)(a) - b;
}

int main()
{
	int n;
	cin >> n;
	cout << fac(n) << endl;
	cout << haha(fac,n,5) << endl;

	return 0;
}
