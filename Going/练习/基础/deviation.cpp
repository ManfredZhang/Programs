#include <iostream>
#include <cmath>
using namespace std;

double average(double a, double b, double c,double d)
{
	
	return (a+b+c+d)/4;
}

int main()
{
	double a,b,c,d;
	double averagenum;

	while(cin >> a >> b >> c >> d)
	{
		averagenum = average(a,b,c,d);

		a = pow(a-averagenum,2);
		b = pow(b-averagenum,2);
		c = pow(c-averagenum,2);
		d = pow(d-averagenum,2);	

		averagenum = average(a,b,c,d);

		cout << sqrt(averagenum) << endl;
	}

	return 0;
}