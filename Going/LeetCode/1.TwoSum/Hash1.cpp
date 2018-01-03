#include <iostream>
#include <map>
#include <vector>
using namespace std;

class Solution 
{
public:
    vector<int> twoSum(vector<int>& nums, int target) 
    {
        map<int, int> HashMap;
        vector<int> Result;
        map<int, int>::iterator it;
        
        for (int i = 0; i < nums.size(); i++)
        {
            int complement = target - nums[i];
            it = HashMap.find(complement);
            if (it != HashMap.end() && HashMap[complement] != i)
            {
                Result.push_back(i);
                Result.push_back(HashMap[complement]);
                return Result;
            }
            HashMap.insert(pair<int,int> (nums[i], i));//插入map的方法
        }
        
        return Result;
    }
};

int main()
{
	vector<int> nums;
	nums.push_back(3);
	nums.push_back(2);
	nums.push_back(4);
	int target = 6;

	vector<int> re;
	Solution s;
	re = s.twoSum(nums, target);

	cout << re[0] << " " << re[1] << endl;

	return 0;

}