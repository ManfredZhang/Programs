#include <iostream>
using namespace std;
int main()
{

	int a[10],i = 0,k = 9;
	
	for (i = 0; i < 10; i++)
	{
		cin >> a[i];
	}
	i = 0;
	while (i < k)
	{
		if (a[i] == 0)
		{
			a[i] = a[k];
			k = k - 1;
			
		}
		else
			i = i + 1;
		
	}
	
	for (i = 0; i < k ; i++)
	{
		
			cout << a[i] << " ";
	}
	
	cout << endl;

	return 0;
}
