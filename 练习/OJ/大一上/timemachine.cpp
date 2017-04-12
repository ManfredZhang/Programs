#include <iostream>
using namespace std;

int main()
{
	int h1,m1,h2,m2;
	char apm[2],amp[2];

	while(cin >> h1 >> m1 >> apm[0] >> apm[1] >> h2 >> m2 >> amp[0] >> amp[1])
	
	{
		if(apm[0] == 'A' || h1 == 12)
		h1 = h1 * 60;
	else
		h1 = (12 + h1) * 60;
	m1 = h1 + m1;

	

	if(amp[0] == 'A' || h2 == 12)
		h2 = h2 * 60;
	else
		h2 = (12 + h2) * 60;
	m2 = h2 + m2;	

	if(m1 > m2)
		cout << 24*60 - m1 + m2 << endl;
	if(m1 <= m2)
		cout << m2 - m1 << endl;
	}
	return 0;
}
