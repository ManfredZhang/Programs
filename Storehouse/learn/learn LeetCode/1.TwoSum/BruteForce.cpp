#include <iostream>
#include <vector>
using namespace std;

class Solution {
public:
    vector<int> twoSum(vector<int> &numbers, int target) 
    {
        int i, j, sum;
        vector<int> results;
        for(i=0; (i<numbers.size()-1); i++)
        {
            //if(numbers[i]>target) continue; //这样判断不行，因为可能有负数+正数=target的情况
            for(j=i+1; j<numbers.size(); j++)
            {
                //if(numbers[j]>target) continue;
                sum=numbers[i]+numbers[j];
                if(sum==target)
                {
                    //cout<<"index1="<<(i+1)<<", index2="<<(j+1)<<endl;
                    results.push_back(i+1);
                    results.push_back(j+1);
                }
            }
        }
        return results;
    }
};

int main()
{
    return 0;
}