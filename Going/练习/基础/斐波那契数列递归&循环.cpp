#include <iostream>
using namespace std;

int fib(int n)
{
	if (n == 0)
		return 0;
	if (n == 1)
		return 1;
	
	return fib(n-1) + fib(n-2);
}

int main()
{
	int a = 1;
	int b = 0;

	for (int i = 0; i < 10; ++i)
	{
		if (i%2 == 0)
		{
			a = a + b;
			cout << a << " ";
		}
		else
		{
			b = a + b;
			cout << b << " ";
		}
	}

	cout << endl;

	for (int i = 1; i < 11; ++i)
	{
		cout << fib(i) << " ";
	}
	cout << endl;

	return 0;
}