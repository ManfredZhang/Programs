#include <iostream>
using namespace std;
int main()
{
	int case_num = 0;
	cin >> case_num;
	while (case_num--)
	{
		int bead = 0;
		int compare = 0;
		cin >> bead >> compare;

		int **Matrix = new int *[bead];
		for (int i = 0; i < bead; i++)
			Matrix[i] = new int[bead];

		for (int i = 0; i < bead; i++)
			for (int j = 0; j < bead; j++)
				Matrix[i][j] = 0;

		for (int i = 0; i < compare; i++)
		{
			int p = 0;
			int q = 0;
			cin >> p >> q;
			Matrix[p-1][q-1] = 1;	// 1 represents p > q
			Matrix[q-1][p-1] = -1;	// -1 represents q < p
		}

		/*for (int i = 0; i < bead; i++)
		{
			for (int j = 0; j < bead; j++)
				cout << Matrix[i][j] << " ";
			cout << endl;
		}*/

		for (int i = 0; i < bead; i++)
			for (int p = 0; p < bead; p++)
				for (int q = 0; q < bead; q++)
				{
					if (Matrix[p][i] == 1 && Matrix[i][q] == 1)
						Matrix[p][q] = 1;
					if (Matrix[p][i] == -1 && Matrix[i][q] == -1)
						Matrix[p][q] = -1;
				}

		/*for (int i = 0; i < bead; i++)
		{
			for (int j = 0; j < bead; j++)
				cout << Matrix[i][j] << " ";
			cout << endl;
		}*/

		int answer = 0;
		for (int i = 0; i < bead; i++)
		{
			int smaller = 0;
			int bigger = 0;
			for (int j = 0; j < bead; j++)
			{
				if (Matrix[i][j] == 1)
					bigger++;
				else if (Matrix[i][j] == -1)
					smaller++;
			}
			if (bigger >= (bead+1)/2)
				answer++;
			else if (smaller >= (bead+1)/2)
				answer++;
		}
		cout << answer << endl;
	}
	return 0;
}
