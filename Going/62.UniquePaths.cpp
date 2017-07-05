#include <iostream>
using namespace std;

class Solution
{
public:
	int uniquePaths(int m, int n)
	{
		int **Array = new int *[m];
		for (int i = 0; i < m; ++i)
			Array[i] = new int[n];

		for (int i = 0; i < m; ++i)
			Array[i][0] = 1;
		for (int i = 0; i < n; ++i)
			Array[0][i] = 1;

		for (int i = 1; i < m; ++i)
		{
			for (int j = 1; j < n; ++j)
				Array[i][j] = Array[i - 1][j] + Array[i][j - 1];
		}

		return Array[m - 1][n - 1];
	}
};

int main()
{
	Solution a;
	cout << a.uniquePaths(3,4);
	return 0;
}