#include <iostream>
#include <cmath>
using namespace std;
int main()
{
	double area;
	double side;
	cout << "Enter the floor area in square feet of your home.\n";
	cin >> area;
	side = sqrt(area);
	cout << "That's equivalent of a square "<< side <<" feet to the side.\n";
	return 0;
}