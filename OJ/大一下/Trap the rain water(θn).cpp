#include <iostream>
using namespace std;

int absolute(int a)
{
    if (a>0)
        return a;
    else
        return -a;
}

int main()
{
//输入
    int column_num;
    cin >> column_num;
    int *wall = new int[column_num];
    for (int i = 0; i < column_num; i++)
        cin >> wall[i];
    
//排除两端无效的墙砖
    int head_flag = -1;
    int tail_flag = -1;
    //前端
    for (int i = 0; i < column_num; i++)
        if (wall[i] != 0)
        {
            head_flag = i;
            break;
        }
    for (int i = head_flag; i < column_num; i++)
    {
        if (wall[i+1] >= wall[i] && (i+1) < column_num)
            head_flag = i+1;
        else
            break;
    }
    //后端
    for (int i = column_num-1; i > -1; i--)
        if (wall[i] != 0)
        {
            tail_flag = i;
            break;
        }
    for (int i = tail_flag; i > -1; i--)
    {
        if (wall[i-1] >= wall[i] && (i-1) > -1)
            tail_flag = i-1;
        else
            break;
    }

    int max = 0;
    int max_flag = 0;
    for (int i = head_flag; i < tail_flag+1; i++)
    {
        if (max < wall[i])
        {
            max = wall[i];
            max_flag = i;
        }
    }
//移一位补一位的水，更新单侧最高时不补水
    int water = 0;
    
    int max_left = 0;
    int max_right = 0;
    
    
    for (int i = head_flag; i < max_flag+1; i++)
    {
        if (wall[i] > max_left)
            max_left = wall[i];
        else
            water += (max_left-wall[i]);
    }
    
    for (int i = tail_flag; i > max_flag-1; i--)
    {
        if (wall[i] > max_right)
            max_right = wall[i];
        else
            water += (max_right-wall[i]);
    }
    

    cout << water << endl;
    
    
    
    return 0;
}
