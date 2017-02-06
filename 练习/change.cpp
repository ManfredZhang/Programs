#include <iostream>
using namespace std;

int main()
{
	int all,quarter,remain,dime,penny;

	cin >> all;

	quarter = all / 25;
	remain = all % 25;
	dime = remain / 10;
	remain = remain % 10;
	penny = remain;

	cout << quarter << endl << dime << endl << penny << endl;

	return 0;

}