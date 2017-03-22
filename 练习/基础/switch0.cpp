#include <iostream>

using namespace std;
int main()
{
	char a;
	cin >> a;
	
	switch(a)
	{
		case 'a':
		
		cout << "str1\n" <<endl;
		break;

		case 'b':
		
		cout << "str2\n" <<endl;
		break;

		default:
		
		cout << "str3\n" <<endl;
		break;
	}
	int b;
	cin >> b;
	switch(b)
	{
		case 1:
		
		cout << "str1\n" <<endl;
		break;

		case 2:
		
		cout << "str2\n" <<endl;
		break;

		default:
		
		cout << "str3\n" <<endl;
		break;
	}
	return 0;
}