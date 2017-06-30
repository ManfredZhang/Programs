#include <iostream>
using namespace std;
int main()
{
	char a,b;
	while(cin >> a >> b)
	{
		if (a == 'P' , b =='R' )
			cout << "User 1 wins(Paper covers rock)\n";
		if (a == 'R' , b == 'P')
			cout << "User 2 wins(Paper covers rock)\n";
		if (a == 'P' , b == 'S')
			cout << "User 2 wins(Scissors cut paper)\n";
		if (a == 'S' , b == 'P')
			cout << "User 1 wins(Scissors cut paper)\n";
		if (a == 'S' , b == 'R')
			cout << "User 2 wins(Rock breaks scissors)\n";
		if (a == 'R' , b == 'S')
			cout << "User 1 wins(Rock breaks scissors)\n";
		if (a == b)
			cout << "Nobody wins.\n";
	}
	return 0;
}