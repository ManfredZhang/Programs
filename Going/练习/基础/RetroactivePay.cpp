#include <iostream>
#include <iomanip>
using namespace std;
int main()
{
	float previous;
	cin >> previous;
	
	float retroactive = previous * 0.038;
	float na = previous * 1.076;
	float nb = na / 12;
	cout<<setprecision(2)<<fixed<<retroactive;
	cout<<",";
	cout<<setprecision(2)<<fixed<<na;
	cout<<",";
	cout<<setprecision(2)<<fixed<<nb<<"\n";

	return 0;
}