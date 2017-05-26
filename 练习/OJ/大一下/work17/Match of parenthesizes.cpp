#include <iostream>
#include <vector>
#include <string>

using namespace std;
int main()
{
	int left1 = 0;
	int right1 = 0;
	int left2 = 0;
	int right2 = 0;
	int left3 = 0;
	int right3 = 0;

	string input;
	cin >> input;

	for (int i = 0; i < input.length(); i++)
	{
		if (input[i] == '(')
			left1++;
		else if (input[i] == ')')
			right1++;
		else if (input[i] == '[')
			left2++;
		else if (input[i] == ']')
			right2++;
		else if (input[i] == '{')
			left3++;
		else if (input[i] == '}')
			right3++;
		else
			cout << "error";
	}

	int total = 0;
	int a = left1 - right1;
	if (a == 0)
		total += left1;
	else
	{
		cout << "0" << endl;
		return 0;
	}

	int b = left2 - right2;
	if (b == 0)
		total += left2;
	else
	{
		cout << "0" << endl;
		return 0;
	}

	int c = left3 - right3;
	if (c == 0)
		total += left3;
	else
	{
		cout << "0" << endl;
		return 0;
	}

	cout << total << endl;
	
	return 0;
}