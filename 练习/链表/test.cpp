#include <iostream>
using namespace std;
int main()
{
	int a = 3;
	
	string b;
	b[0] = a + '0';
	b[1] = a+1 + '0';
	b[2] = a+2 + '0';

	cout << b << endl;

	cout << b[0] << b[1] << endl;

	return 0;
}