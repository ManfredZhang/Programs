#include <iostream>
using namespace std;

int fib(int n)
{
	if (n == 0)
		return 0;
	if (n == 1)
		return 1;
	return (fib(n-1)+fib(n-2));
}

int main()
{
	int initial,days,fibn;
	while(cin >> initial >> days)

	{
		fibn = days/5 + 1;

		cout << fib(fibn)*initial << endl;
	}
	return 0;

}