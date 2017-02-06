#include <iostream>
using namespace std;

int matrix[24][82];

int liveordie(int i, int j, int p)
{
	int count = 0;

	for (int w = i - 1; w <= i + 1; w++)
	{
		for (int a = j - 1; a <= j + 1; a++)
		{
			if (matrix[w][a] == 1)
				count++;
		}
	}

	if (p == 0)
	{
		if (count == 3)
			return 1;
		else
			return 0;
	}

	if (p == 1)
	{
		count--;
		if (count < 2)
			return 0;
		if (count > 1 && count < 4)
			return 1;
		if (count > 3)
			return 0;
	}
}

int main()
{
    int time;
    int done = 0;
        cin >> time;

	for (int i = 1; i <= 22; i++)
	{
		for (int j = 1; j <= 80; j++)
		{
			char temp;
			temp = cin.get();
			if (temp == ' ')
				matrix[i][j] = 0;
			else if (temp == '*')
				matrix[i][j] = 1;
			else
				j--;
		}
	}

	for (int i = 1; i <= 22; ++i)
	{
		matrix[i][0] = matrix[i][80];
	}
	for (int i = 1; i <= 22; ++i)
	{
		matrix[i][81] = matrix[i][1];
	}
	for (int i = 1; i <= 80; ++i)
	{
		matrix[0][i] = matrix[22][i];
	}
	for (int i = 1; i <= 80; ++i)
	{
		matrix[23][i] = matrix[1][i];
	}

	int matrixgo[22][80];

	for (int go = 0;go < time; go++)
	{
		for (int i = 0; i < 22; i++)
		{
			for (int j = 0; j < 80; j++)
				matrixgo[i][j] = liveordie(i+1,j+1,matrix[i+1][j+1]);
		}


		 if (done == time - 1)
			for (int i = 0; i < 22; i++)
			{
				for (int j = 0; j < 80; j++)
				{
		            if(matrixgo[i][j] == 0)
		            	cout << " ";
		            if(matrixgo[i][j] == 1)
		            	cout << "*";
		        }
				cout << endl;
			}
		
		for (int i = 0; i < 22; i++)
		{
			for (int j = 0; j < 80; j++)
			{
	            matrix[i+1][j+1] = matrixgo[i][j];
	        }
		}
		for (int i = 1; i <= 22; ++i)
		{
			matrix[i][0] = matrix[i][80];
		}
		for (int i = 1; i <= 22; ++i)
		{
			matrix[i][81] = matrix[i][1];
		}
		for (int i = 1; i <= 80; ++i)
		{
			matrix[0][i] = matrix[22][i];
		}
		for (int i = 1; i <= 80; ++i)
		{
			matrix[23][i] = matrix[1][i];
		}

		
		done++;
	}

	return 0;
}
