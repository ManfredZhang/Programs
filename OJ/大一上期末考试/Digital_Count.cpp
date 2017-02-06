#include <iostream>
using namespace std;
int main()
{
    int array[10][3];
    int times;
    cin >> times;

//输入题目    
    for (int i = 0; i < times; ++i)
    {
        for (int j = 0; j < 3; ++j)
        {
            cin >> array[i][j];
        }
    }

//把从最小值到最大值所有数列出来到all数组里    
    int all[10][100000];
    for (int i = 0; i < times; ++i)
    {
        for (int j = array[i][0]; j <= array[i][1]; ++j)
        {
            all[i][j-array[i][0]] = j;
        }
    }

//把all数组里每个数的每一位提出来找要找的数计数    
    int count[10];
    for (int i = 0; i < 10; ++i)
    {
        count[i] = 0;
    }

    for (int i = 0; i < times; ++i)
    {
        for (int j = 0; j < array[i][1]-array[i][0]+1; ++j)
        {
            if (all[i][j]%1000000/100000 == array[i][2])
                count[i]++;
            if (all[i][j]%100000/10000 == array[i][2])
                count[i]++;
            if (all[i][j]%10000/1000 == array[i][2])
                count[i]++;
            if (all[i][j]%1000/100 == array[i][2])
                count[i]++;
            if (all[i][j]%100/10 == array[i][2])
                count[i]++;
            if (all[i][j]%10 == array[i][2])
                count[i]++;
        }
    }

//输出答案
    for (int i = 0; i < times; ++i)
    {
        cout << count[i] << endl;
    }
    
    
    
    return 0;
}