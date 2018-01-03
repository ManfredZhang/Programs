/*插入排序
输入 1 5 2 4 3
一 1
二 1 5
三 1 2 5
四 1 2 4 5
五 1 2 3 4 5
*/




#include <iostream>
using namespace std;

void swap(int array[],int i)
{
    int temp;
    temp = array[i];
    array[i] = array[i-1];
    array[i-1] = temp;
    return;
}

int main()
{
    int array[5];
    for (int i = 0; i < 5; ++i)
    {
        cin >> array[i];
    }
    
    
    
    
    
    for (int i = 0; i < 5; ++i)
    {
        int t = i;
        while (i-1 >= 0 && array[i-1] > array[i])
        {
            swap(array,i);
            i--;
        }
        i = t;
    }
    
    
    
    
    
    for (int i = 0; i < 5; ++i)
    {
        cout << array[i] <<" ";
    }
    cout << endl;
    
    return 0;
    
}
