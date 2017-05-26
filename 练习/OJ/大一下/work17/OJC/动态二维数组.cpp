#include <iostream>
using namespace std;

int main()  
{  
    int row,column;  
    cin >> row >> column;  
  
    //方法一  
    //申请空间  
    int ** a = new int *[row];  
    for(int i = 0;i < row;i++)  
        a[i] = new int[column]; 

    //方法二
    //申请空间
    //vector<vector<int> > a(row,vector<int>(column));

  
    //使用空间  
    for(int j = 0;j < row;j++)  
        for(int k = 0;k< column;k++)  
            a[j][k] = rand()%100;  
  
    for(int j = 0;j < row;j++)  
    {  
        cout<<endl;  
        for(int k = 0;k< column;k++)  
        {  
            a[j][k] = rand()%100;  
            cout<<a[j][k]<<"     ";  
        }  
    }  
          
    //释放空间  
    for(int i = 0;i < row;i++)  
    {  
        delete a[i];  
        a[i] = NULL;  
    }  
    delete a[row];  
    a = NULL;     
  
    return 0;  
      
}  