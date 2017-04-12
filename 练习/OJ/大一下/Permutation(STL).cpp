//next_permution()只能把该排列字典顺序之后的所有排列输出
//所以要先把序排好再传入，不输出第一个（排好序的），要提前输出

#include <iostream>
#include <algorithm>
#include <string.h>
using namespace std;

int main()
{
    string a[200];
    int time;
    cin >> time;
    
    for (int i = 0; i < time; ++i)
    {
        cin >> a[i];
    }

    for (int i = 0; i < time; ++i)
    {
        int len = a[i].length();

        sort(&a[i][0],&a[i][0]+len);

        cout << a[i] <<endl;
        
        while(next_permutation(&a[i][0],&a[i][0]+len))
            cout << a[i] << endl;
        
        if (i != time - 1)
            cout << endl;
    }
        
    
    return 0;
}
