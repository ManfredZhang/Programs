#include <iostream>
using namespace std;
int main()
{
	struct Student 
	{
		int number; 
		char name; 
	}s1;

	struct hello
	{
		int i;
		double score;
		Student *ps;
	}h,*ph;

	ph = &h;
	ph -> ps = &s1;

	ph -> i = 10;			//相当于ph.i = 10 或h.i = 10
	ph -> score = 99.5;
	ph -> ps -> number = 66;
	ph -> ps -> name = 'm';

	return 0;
}