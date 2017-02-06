#include <iostream>
using namespace std;
void manfred (int);

int main()
{
	manfred (3);
	cout << "pick an integer\n";
	int count;
	cin >> count;
	manfred (count);
	cout << "Done\n";
	return 0;
}

void manfred(int n)
{
	cout << "manfred said clap your hand "<< n <<" times\n";
}