#include <iostream>
#include <ctime>
using namespace std;

bool exam(int A[], int B[], int C[])
{
	int first = 0;
	int second = 0;
	int third = 0;
	for (int i = 0; i < 6; ++i)
	{
		for (int j = 0; j < 6; ++j)
		{
			if (A[i] > B[j])
				first++;
			if (B[i] > C[j])
				second++;
			if (C[i] > A[j])
				third++;
		}
	}
	return (first > 20 && second > 20 && third > 20);
}

int main()
{
	srand((unsigned)time(NULL));
	//cout << rand()%6+1;

	int A[6];
	int B[6];
	int C[6];

	while (exam(A,B,C) == 0)
	{
		for (int i = 0; i < 6; ++i)
		{
			A[i] = rand()%6+1;
			B[i] = rand()%6+1;
			C[i] = rand()%6+1;			
		}
		for (int i = 0; i < 6; ++i)
		{
			cout << A[i] << " " << B[i] << " " << C[i] << endl;
		}
	}

	cout << "booooooooom!" << endl;

	for (int i = 0; i < 6; ++i)
	{
		cout << A[i] << " " << B[i] << " " << C[i] << endl;
	}

	return 0;
}