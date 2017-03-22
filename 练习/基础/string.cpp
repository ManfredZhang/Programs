#include  <iostream>

using namespace std;
int main()
{
	string str1 = "Hello World\n";
	string str2 ("Hello 2\n");
	string str3 (str1,5,2);
	
	char ch_music[] = {"Roly-Poly"};
	string str4 (ch_music,4);
	string str5 (10,'d');
	cout << str5<<endl;
	return 0;
}