#include <iostream>
using namespace std;

int SOLVE(int coupon, int choconum)
{
	if (coupon < 7)
	{
		return choconum;
	}
	else
	{
		int temp = choconum;
		choconum += coupon / 7;
		coupon = coupon % 7 + choconum - temp;
		return SOLVE(coupon, choconum);
	}
}

int main()
{
	int money;

	while (cin >> money)
	{
		int choconum = 0;
		int coupon = 0;
		choconum = money;
		coupon = money;

		cout << SOLVE(coupon, choconum) << endl;
	}

	return 0;
}