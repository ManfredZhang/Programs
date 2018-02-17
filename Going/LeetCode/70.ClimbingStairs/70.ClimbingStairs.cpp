/*
d[i] = d[i - 1] + d[i - 2]
一维储存的最简单的动态规划
*/

#include <iostream>
#include <vector>
using namespace std;

class Solution
{
public:
    int climbStairs(int n) 
    {
        int *A = new int[n + 1];
        A[0] = 0;
        A[1] = 1;
        A[2] = 2;
        for (int i = 3; i <= n; ++i)
        {
        	A[i] = A[i - 1] + A[i - 2];
        }
        return A[n];
    }
};

int main()
{
	Solution a;
	cout << a.climbStairs(7) << endl;

	return 0;
}
