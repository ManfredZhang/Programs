#include <iostream> 
using namespace std;

double average(double, double);
double average(int, int, int);

int main()
{
	double a,b,f,g;
	int c,d,e;

	cout << "顺序输入两个小数和三个整数 > ";
	cin >> a >> b >> c >> d >> e;

	f = average(a,b);
	g = average(c,d,e);

	cout << f << endl << g << endl;

	return 0;
}

double average(double n1 , double n2)
{
	return (n1 + n2)/2;
}

double average(int n1, int n2, int n3)
{
	return (n1 + n2 + n3)/3;
}