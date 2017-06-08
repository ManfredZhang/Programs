#include <iostream>
#include <cmath>
using namespace std;
int main()
{
	double a;
	while (cin >> a)
	{
		a = 20*log(a)/log(10);
		cout << a << endl;
	}
	return 0;
}
	
