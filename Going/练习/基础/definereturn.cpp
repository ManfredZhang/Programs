#include <iostream>
using namespace std;
int stonetolb(int);
int main()
{
	int stone;
	cout << "Enter the weight in stone.\n";
	cin >> stone;
	int pounds = stonetolb(stone);
	cout << stone << " stone = " << pounds << " pounds.\n";
	return 0;
}

int stonetolb(int sts)
{
	return 14 * sts;
}