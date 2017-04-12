#include <iostream>
using namespace std;
int main()
{
	int length;
	cin >> length;

//把ogogogo都换成*
	char interview[120];
	for (int i = 0; i < 120; ++i)
	{
		interview[i] = '0';
	}

	for (int i = 0; i < length; ++i)
		cin >> interview[i];

	for (int i = 0; i < length; ++i)
		if (interview[i] == 'o' && interview[i+1] == 'g' && interview[i+2] == 'o')
			for (int j = i; j < length; ++j)
			{
				if (interview[j] == 'g' && interview[j+1] == 'o' && interview[j+2] != 'g')
				{
					for (int p = i; p < j+2; ++p)
						interview[p] = '*';
					break;
				}

				else if (interview[j] == 'g' && interview[j+1] == 'o' && interview[j+2] == 'g' && interview[j+3] != 'o')
				{
					for (int q = i; q < j+2; ++q)
                        interview[q] = '*';
                    break;
				}
                        
			}



//三个*之后的*都不输出
	for (int i = 0; i < length; ++i)
	{
		if (interview[i] == '*' && interview[i+1] == '*' && interview[i+2] == '*')
		{
			for (int j = i+2; j < length; ++j)
				if (interview[j] == '*' && interview[j+1] != '*')
                {
					for (int p = i+3; p < j+1; ++p)
						interview[p] = '^';
                    
                    break;
                }
		}
		
		if (interview[i] != '^')
			cout << interview[i];
	}

	cout << endl;
 

	return 0;
}
