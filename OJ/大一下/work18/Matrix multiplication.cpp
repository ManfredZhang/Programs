#include <iostream>
using namespace std;

int MATRIX_CHAIN_ORDER(int *p, int n)
{
	int **m = new int *[n + 1];
	for (int i = 0; i < n + 1; ++i)
		m[i] = new int[n + 1];
	

	for (int i = 1; i < n + 1; ++i)
		m[i][i] = 0;

	int j = 0;
	int q = 0;
	for (int l = 2; l < n + 1; ++l)
	{
		for (int i = 1; i <= n - l + 1; ++i)
		{
			j = i + l - 1;
			m[i][j] = 2147483647;
			for (int k = i; k < j; ++k)
			{
				q = m[i][k] + m[k + 1][j] + p[i - 1]*p[k]*p[j];
				if (q < m[i][j])
					m[i][j] = q;
			}
		}
	}

	/*for (int i = 1; i < n + 1; ++i)
	{
		for (int j = 1; j < n + 1; ++j)
		{
			cout << m[i][j] << " ";
		}
		cout << endl;
	}*/
	

	return m[1][n];
}

int main()
{
	int input_num = 0;
	while (cin >> input_num)
	{
		int *Input = new int[input_num + 1];
		for (int i = 0; i < input_num + 1; ++i)
			cin >> Input[i];

		cout << MATRIX_CHAIN_ORDER(Input,input_num) << endl;
	}


	return 0;
}