/*
最大子段和
动态规划递归式：（a[i]存放第i个数；b[i]存放截止到i位置的最优解）
b[i] = max{b[i - 1] + a[i], a[i]}
一维储存的最简单的动态规划
 */



#include <iostream>
#include <vector>
#include <queue>
using namespace std;

int max(int a, int b)
{
	return (a > b ? a : b);
}

class Solution 
{
public:
	int maxSubArray(vector<int>& Nums)
	{
		vector<int> Best_now;
		
		Best_now.push_back(Nums[0]);
		for (int i = 1; i < Nums.size(); ++i)
		{
			cout << max(Best_now[i - 1] + Nums[i], Nums[i]) << endl;
			Best_now.push_back(max(Best_now[i - 1] + Nums[i], Nums[i]));
		}

		int go = Best_now[0];
		for (int i = 0; i < Best_now.size(); ++i)
		{
			if (Best_now[i] > go)
			{
				go = Best_now[i];
			}
		}

		return go;
	}
};

int main()
{
	Solution a;
	vector<int> b;
	
	b.push_back(-2);
	b.push_back(1);
	b.push_back(-3);
	b.push_back(4);
	b.push_back(-1);
	b.push_back(2);
	b.push_back(1);
	b.push_back(-5);
	b.push_back(4);

	cout << "ok, " << a.maxSubArray(b) << endl;
	return 0;
}