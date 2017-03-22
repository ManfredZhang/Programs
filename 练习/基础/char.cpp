#include <iostream>
using namespace std;
int main()
{
	
	cout <<  "Tell me a character:";
	char ch;
	cin >> ch;
	int i = ch;
	cout << "The ASCII code for " << ch << " is "<< i <<endl;
	cout << "Add 1 to the character code :";
	ch = ch+1;
	i = ch;
	cout << "The ASCII code for " << ch << " is "<< i << endl;

	cout << "Display char ch using cout.put(ch):\n";
	cout.put(ch);
	cout.put('!');

	cout << endl << "Done" << endl;
	return 0;


}