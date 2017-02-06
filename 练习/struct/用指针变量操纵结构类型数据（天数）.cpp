#include <iostream>
using namespace std;

struct date
{
	int year;
	int month;
	int day;
	int total;
}d;

void countday(struct date *d)
{
	d -> total = 0;
	int monthtable[][13] = 
	{
		{0, 31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31}, 
		{0, 31, 29, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31}
	};

	d -> total = d -> day;

	int leap = 0;
	if( ((d -> year %4 == 0) && (d -> year %100 != 0))|| (d -> year % 400 == 0) )
		leap = 1;
	for (int i = 0; i < d -> month; ++i)
	{
		d -> total += monthtable[leap][i];
	}

	cout << d -> total << endl;
}

int main()
{
	cin >> d.year >> d.month >> d.day;

	countday(&d);

	return 0;
}
