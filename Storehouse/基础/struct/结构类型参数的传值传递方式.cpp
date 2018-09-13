#include <iostream>
using namespace std;

enum FeMale {F, M}; 
struct stu
{
	int id;
	char name; 
	FeMale s;
	int age;
	double score;
};

void f(stu s1)
{
	s1.name = 't';
	s1.score = 100;

	cout << s1.name << ": " << s1.score << endl;
}

int main()
{
	stu s1 = {1,'h',F,90,80};

	cout << s1.name << ": " << s1.score << endl;
	f(s1);//实参和形参代表两个不同的结构变量，运行时分配不同的存储空间。
	cout << s1.name << ": " << s1.score << endl;

	if (s1.s == 0)
	{
		cout << "F" << endl;
	}

	return 0;
}