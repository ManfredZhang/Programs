#include <iostream>
using namespace std;
int main()
{
	int carrots;
	carrots = 25;
	cout << "I have ";
	cout << carrots;
	cout << " carrots.\n";
	for (int i = 0; i < 25; ++i)
	{
	carrots = carrots-1;
	cout << "Crunch, crunch. Now I have "<<carrots<<" carrots.\n";
	}
	return 0;
} 