#include <iostream>
#include <ctime>
using namespace std;

int main()
{
	srand(time(0));
	char problem[9][9];


	for(int i=0;i<9;i++)
	{
		for (int j = 0; j < 9; ++j)
		{
			problem[i][j] = '0' + rand()%9+1;
		}
	}

	for (int i = 0; i < 60; ++i)
	{
		problem[rand()%9][rand()%9] = '0';
	}

	for (int i = 0; i < 9; ++i)
	{
		for (int j = 0; j < 9; ++j)
		{
			cout << problem[i][j] << " ";
		}
		cout << endl;
	}


	return 0;
}