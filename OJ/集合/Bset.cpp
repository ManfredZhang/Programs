#include <iostream>

using namespace std;


int main()
{
    
    //初始化a、b集合
    int num1,num2;
    cin >> num1;
    int* a = new int[num1+2];
    
    int i=0,i1;
    
    while(i<num1)
    {
        cin >> a[i++];
    }

    
    i1 = i ;

    cin >> num2;
    int* b = new int[num2+2];
    int* jiao = new int[num1+num2];
    int* bing = new int[num1+num2];
    int* cha = new int[num1+num2];
    int* cha2 = new int[num1+num2];


    int p=0,i2;
    while(p<num2)
    {
        cin >> b[p++];
    }
    i2 = p ;

    



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
    int temp = 0;
    bool meiyou;
    for (int i = 0; i < i1; ++i)
    {
        for (int j = 0; j < i2; ++j)
        {
            if(a[i] != b[j])
                meiyou = true;
            else
            {
                meiyou = false;
                break;
            }
        }
        if(meiyou)
            {
                cha[m] = a[i];
                m = m + 1;
                temp = 1;
            }    
    }
    
    

    //以下是并集运算
    int u = 0;
    
    for (int p = 0; p < i2; ++p)
    {
        for (int i = 0; i < i1; ++i)
        {
            if(b[p] != a[i])
                meiyou = 1<2;
            else
            {
                meiyou = 1>2;
                break;
            }
        }
        if(meiyou)
            {
                cha2[u] = b[p];
                u = u + 1;
            }    
    }

    for (int i = 0; i < i1; i ++)
    bing[i] = a[i];
    for (int i = i1; i < u+i1; ++i)
    bing[i] = cha2[i-i1];

    

    //输出
    if(h == 0)//交集
        cout << endl;
    else
    {   
        for( i=0; i<h-1; i++ ) 
        {
            cout << jiao[i] << " ";
        }

        cout << jiao[h-1] <<endl;
    }
    
    if(a[0]==-1 && b[0]==-1)//并集
        cout << endl; 
    if(a[0]==-1 && b[0]!=-1)
    {   
        for (int i = 0; i < i2-1; ++i)
        {
            cout << b[i] << " ";
        }
        cout << b[i2-1] << endl;
    }    
    if(a[0]!=-1)
    {
        for( i=0; i<u+i1-1; i++ ) 
        {
            cout << bing[i] << " ";
        }

        cout << bing[u+i1-1] <<endl;
    }
    
    
    if(b[0]==-1 && a[0]!=-1)//差集
    {
        for (int i = 0; i < i1-1; ++i)
        {
            cout << a[i] << " ";
        }
        cout << a[i1-1] << endl;
    }
    else
    {    
        if(m == 0)
        cout << endl;
        else
        {   
            for( i=0; i<m-1; i++ ) 
            {
                cout << cha[i] << " ";
            }

            cout << cha[m-1] <<endl;
        }
    }
    

    //以下是属于判断
    if (temp != 1 && !(a[0]!=-1 && b[0]==-1))
        cout << "true";
    if (temp == 1 ||(a[0]!=-1 && b[0]==-1))
        cout  << "false";


    return 0;
}