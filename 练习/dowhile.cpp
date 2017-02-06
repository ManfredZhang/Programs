#include <iostream>

using namespace std;
int main()
{
	char ans;
	do 
	{
		cout << "Hello!\n";
		cout << "Do you want another greeting? If so, type in 'y' and press return.\n";
		cin >> ans;
		}
	while (ans == 'y' || ans == 'Y');
	cout << "Goodbye.\n";
return 0;
}