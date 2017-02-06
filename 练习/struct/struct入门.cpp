#include <iostream>
using namespace std;

struct student
{
	int number;
	char name;
	int age;
}s1;
struct date
{
	int year;
	int month;
	int day;
};


int main()
{
	student s2;
	date d1,d2;

	struct employee
	{
		int number;
		char name;
		date birthday;
	}e1,e2;

	//s1 = {1,'k'};	error	只有在初始化的时候可以用大括号

	student s3,s4 = {11, 'M'};
	employee e3 = {12, 'L', {1997, 10, 22}};

	cout << s4.name << endl;
	cout << e3.birthday.year << endl;

	return 0;
}