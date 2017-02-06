#include <iostream>
using namespace std;


int main()
{
    
    //初始化a、b集合
    int a[64],b[64],jiao[64],bing[128],cha[64];
    
    int i=0,i1;
    while(i<64)
    {
        cin >> a[i++];
        if ( cin.get() == '\n' ) //遇到回车，结束输入
            break;
    }
    
    i1 = i;

    int p=0,i2;
    while(p<64)
    {
        cin >> b[p++];
        if(cin.get() == '\n')
        {
            break;
        }
    }
    i2 = p;

    



    //以下是交集运算
    int h = 0;

    for (int i = 0; i < i1; ++i)
    {
        for (int j = 0; j < i2; ++j)
        {
            if(a[i] == b[j])
            {
                jiao[h] = a[i];
                h = h + 1;
                break;
            }
        }
    }
    


   

    //以下是差集运算
    int m = 0;
    bool meiyou;
    for (int i = 0; i < i1; ++i)
    {
        for (int j = 0; j < i2; ++j)
        {
            if(a[i] != b[j])
                meiyou = 1<2;
            else
            {
                meiyou = 1>2;
                break;
            }
        }
        if(meiyou)
            {
                cha[m] = a[i];
                m = m + 1;
            }    
    }
    
    

    //以下是并集运算
    for (int i = 0; i < m; i ++)
    bing[i] = cha[i];
    for (int i = m; i < m+i2; ++i)
    bing[i] = b[i-m];



    


    //输出
    for( i=0; i<h; i++ ) //交集
    {
        cout << jiao[i] << " ";
    }

    cout << endl;

    for( i=0; i<m; i++ ) //差集
    {
        cout << cha[i] << " ";
    }

    cout << endl;    
    
    for( i=0; i<m+i2; i++ ) //并集
    {
        cout << bing[i] << " ";
    }

    cout << endl;    

    

    return 0;
}