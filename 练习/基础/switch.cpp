#include <iostream>

using namespace std;
int main()
{
	int a;
	cin >> a;
	string str ("I love");
	string str1 (" Mcdonalds");
	string str2 (" KFC");
	string str3 (" nothing");
	switch(a)
	{
		case 1:
		
		str += str1;
		cout << str <<endl;
		break;

		case 2:
		
		str += str2;
		cout << str <<endl;
		break;

		default:
		
		str += str3;
		cout << str <<endl;
		break;
	}
	return 0;
}


//switch case 中是不能定义对象的，因为只要是在大括号内定义的对象，该对象的作用域就只是局限在当前的那对大括号中，所以就肯定是会报错的