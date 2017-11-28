#include <iostream>
using namespace std;
int main()
{
	int a;
	int b;
	cin >> a >> b;
	int g = a;
	int xx = 1;
	int yy = 0;

	int i = 0;
	int k[50];
	int j[50];
	int q[50];
	int r[50];
	int x[50];
	int y[50];

	if (a == b)
	{
		cout << "gcd(" << a << "," << b << ") = " << g << " = " << xx << "*" << a << " + " << yy << "*" << b << endl;
		return 0;
	}
	else 
	{
		k[i] = a;
		j[i] = b;

		do
		{
			q[i] = k[i]/j[i];
			r[i] = k[i] - q[i]*j[i];
			k[i+1] = j[i];
			j[i+1] = r[i];
			i = i + 1;
		}
		while (r[i-1] != 0);

		i = i - 1;
		g = j[i];
		y[i] = 0;
		x[i] = 1;
		i = i - 1;

		while (i >= 0)
		{
			y[i] = x[i+1];
			x[i] = y[i+1] - q[i] * x[i+1];
			i = i - 1;
		}
		cout << "gcd(" << a << "," << b << ") = " << g << " = " << y[0] << "*" << a << " + " << x[0] << "*" << b << endl;
	}
	return 0;
}
