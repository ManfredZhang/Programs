#include <iostream>
using namespace std;

#define N 10 
int main()
{
    int a[N] = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9};
    int *pa = a;
    
    for(int i=0; i<N; i++)
        cout << pa[i] << ' '; //下标法，用a[i]也行
    cout << endl;
    
    for(pa = a; pa < (a + N); pa++) //指针移动法，用a++不行(思考原因)
        cout << *pa << ' ';
    cout << endl;
    
    pa = a;
    for(int i = 0; i < N; i++)//这里没有“pa = a, i = 0”，则会出现越界!
        cout << *(pa + i) << ' '; //偏移量法，用*(a + i)也行
    cout << endl;
    
    return 0;
}
