#include <iostream>
#include <string>
using namespace std;
int main()
{
	string input;
	cin >> input;

	int num_of_right = 0;
	for (int i = 0; i < input.length(); i++)
		if (input[i] == ')')
			num_of_right++;

	long long total = 0;
	for (int i = 0; i < input.length(); i++)
	{
		if (input[i] == '(')
			total += num_of_right;
		else
			num_of_right--;
	}

	cout << total << endl;

	int a;
	cin >> a;

	return 0;
}