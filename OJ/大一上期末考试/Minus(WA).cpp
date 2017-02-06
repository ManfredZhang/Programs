//基本运算问题，负数问题，结果前面0的问题已经解决，在我的电脑上运行正常，不知为何WA。。。


#include <iostream>
using namespace std;
int main()
{
    int a[1000];
    int b[100];
    
    for (int i = 0; i < 1000; ++i)
        a[i] = 0;
    for (int i = 0; i < 100; ++i)
        b[i] = 0;
  
//输入两个数字
    int i = 0;
    char tempa;
    int num_a;
    while(i<1000)
    {
        tempa = cin.get();
        if ( tempa == '\n' || tempa == ' ')
        {
            num_a = i;
            break;
        }
        else
        {
            a[i] = tempa - 48;
            i++;
        }
    }
    
    i = 0;
    char tempb;
    int num_b;
    while(i<100)
    {
        tempb = cin.get();
        if ( tempb == '\n' || tempb == -' ')
        {
            num_b = i;
            break;
        }
        else
        {
            b[i] = tempb - 48;
            i++;
        }
    }

/*若b数组第一个是负号代表的45（45-48=-3）则把b数组每个数取负数
    if (b[0] == -3)
    {
        for (int i = 0; i < 100; ++i)
        {
            b[i] = -1 * b[i+1];
        }
        num_b = num_b - 1;
    }
 */
    
//使a数>b数，否则调换位置
    int temp[100];
    int tempnum;
    
        
    if (num_a < num_b)
    {
        for (int i = 0; i < 100; ++i)
        {
            temp[i] = a[i];
            a[i] = b[i];
            b[i] = temp[i];
            tempnum = num_a;
            num_a = num_b;
            num_b = tempnum;
        }
        cout << "-";
    }
    else if (num_a == num_b && a[0] < b[0])
    {
        for (int i = 0; i < 100; ++i)
        {
            temp[i] = a[i];
            a[i] = b[i];
            b[i] = temp[i];
            tempnum = num_a;
            num_a = num_b;
            num_b = tempnum;
        }
        cout << "-";
    }
    
//b数前面补0
    for (int i = 0; i < num_a - num_b; ++i)
    {
        b[i+num_a - num_b] = b[i];
        b[i] = 0;
    }
    
    int outcome[1000];
    for (int i = 0; i < 1000; ++i)
    {
        outcome[i] = a[i] - b[i];
        if (outcome[i] < 0)
        {
            outcome[i-1] = outcome[i-1]-1;
            outcome[i] = 10 - outcome[i];
        }
    }

//结果前面的0不要
    int begin=0;
    while(outcome[begin] == 0)
        begin++;

//输出结果
    for (int i = begin; i < num_a; ++i)
    {
        cout << outcome[i];
    }
    
    bool same = true;
    for (int i=0; i< 100; i++)
    {
        if (a[i]!=b[i])
        {
            same = false;
        }
    }
    if(same==true)
    {
        cout << "0";
    }
    
    
    return 0;
}
