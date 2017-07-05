#include <iostream>
#include <ctime>
using namespace std;
int main()
{
 int a;
 a=time(0);//time(0)返回的是系统的时间（从1970.1.1午夜算起），单位：秒
 while(1)
 cout<<a<<endl;
 return 0;
}