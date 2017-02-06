#include <iostream>
#include <iomanip>
using namespace std;
int main()
{
	int i;
	double a;
	float sumz=0, sumf=0, suma=0; 
	for (int i = 0; i < 10; ++i)
	{
		cin >> a;
		if (a > 0)
		sumz = sumz + a;
		else sumf = sumf + a;

		suma = suma + a;
	}
	cout<<setprecision(2)<<fixed<<sumz<<","<<sumf<<","<<suma<<"\n";
	return 0;
}