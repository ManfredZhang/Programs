#include <iostream>
using namespace std;

#define max3(a,b,c) (((a)>(b))?(((a)>(c))?(a):(c)):(((b)>(c))?(b):(c)))
int main()
{
	int a,b,c;
	cin >> a >> b >>c;
	cout << max3(a,b,c) << endl;
	return 0;
}