#include <iostream>
#include <cmath>
#include <iomanip>

using namespace std;

double fac(double);
double sum(double,double);

double x,numn;


int main()
{
	while(cin >> x)

	{
		int i;
	

		cout <<setprecision(3) <<fixed << (sum (x,100)+1) << endl;
		for(i=0 ; i<10 ;i++)
		{
			for(numn = (1+10*i); numn < 10*(i+1); numn++)
			{
				cout <<setprecision(3) <<fixed << (sum (x,numn)+1) <<" ";
			}
		cout <<setprecision(3) <<fixed << (sum (x,10*(i+1))+1) << endl;
		}
	}
	

	return 0;
}

double fac(double num)
{
	if (num == 0)
		return 1;
	return num * fac(num - 1);
}


double sum(double x,double numn)
{
	
	if (numn == 0)
		return 0;
	return pow(x,numn) / fac(numn) + sum (x , (numn-1));
}