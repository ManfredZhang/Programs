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
	vector<int> maxSubArray(vector<int>& Nums)
	{
		vector<int> Best_now;
		vector<int> Out;
		vector<int> Clear;
		
		Best_now.push_back(Nums[0]);
		for (int i = 1; i < Nums.size(); ++i)
		{
			Best_now.push_back(max(Best_now[i - 1] + Nums[i], Nums[i]));
			if (Best_now[Best_now.size() - 1] == Nums[i])
			{
				Out = Clear;
				Out.push_back(i);
				//cout << "clear @" << i << endl;
			}
			else
			{
				Out.push_back(i);
			}
		}

		int go = Best_now[0];
		int index;
		for (int i = 0; i < Best_now.size(); ++i)
		{
			if (Best_now[i] > go)
			{
				go = Best_now[i];
				index = i;
			}
		}
		Out.push_back(index);
		Out.push_back(go);

		return Out;
	}
};

int main()
{
	Solution a;
	vector<int> b;
	
	b.push_back(-2);
	b.push_back(1);//c
	b.push_back(-3);
	b.push_back(4);//c
	b.push_back(-1);
	b.push_back(2);
	b.push_back(1);
	b.push_back(-5);
	b.push_back(4);

	vector<int> c;
	c = a.maxSubArray(b);

	cout << "Result: " << endl << c[c.size() - 1] << endl;
	cout << "Choice: " << endl;
	for (int i = 0; i < c.size() - 2; ++i)
	{
		cout << b[c[i]] << endl;
		if (c[i] == c[c.size() - 2])
			break;
	}
	return 0;
}