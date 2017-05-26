#include <iostream>
using namespace std;

int GET_MIN(int a, int b)
{
    if (a > b)
        return b;
    else
        return a;
}

int main()
{
    //创建两个以树高为宽，最底层长度为长的表
    //一个是原来的树
    //一个是储存该结点及以下的最小伤害值
    int depth;
    cin >> depth;

    int **Tree = new int *[depth];
    for(int i = 0; i < depth; i++)
        Tree[i] = new int[depth];
    int **Table = new int *[depth];
    for(int i = 0; i < depth; i++)
        Table[i] = new int[depth];

    

    //初始化两个表
    //输入已知的树
    for (int i = 0; i < depth; ++i)
    {
        for (int j = 0; j < depth; ++j)
        {
            Tree[i][j] = 0;
            Table[i][j] = 0;
        }
    }

    for (int i = 0; i < depth; ++i)
    {
        for (int j = 0; j < i + 1; ++j)
        {
            cin >> Tree[i][j];
        }
    }


    //根据递归式
    //m[h,i] = Tree[h,i] (h = H - 1)
    //m[h,i] = min(Table[h+1,i], Table[h+1,i+1] + Tree[h,i] (h < H - 1)
    //计算最小伤害Table[0,0]
    for (int i = depth - 1; i >= 0; --i)
    {
        for (int j = 0; j <= i; ++j)
        {
            if (i == depth - 1)
                Table[i][j] = Tree[i][j];
            else
                Table[i][j] = GET_MIN(Table[i+1][j],Table[i+1][j+1]) + Tree[i][j];
        }
    }

    cout << Table[0][0] << endl;
    
    return 0;
}