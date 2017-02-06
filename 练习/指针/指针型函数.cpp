#include <iostream>
using namespace std;

int *max(const int a[], int n)
{
	int tempmax = 0;
	for (int i = 0; i < n; ++i)
	{
		if (a[i] > a[tempmax])
		{
			tempmax = i;
		}
	}
	return (int*) &a[tempmax];//强制转换成前面要求的int指针（传进来的数组是const int类型）
}

int main()
{
	int a[5] = {1,5,2,4,3};
	*max(a,5) = 0;
	for (int i = 0; i < 5; ++i)
	{
		cout << a[i] << " ";
	}
	cout << endl;

	return 0;
}

/*
 #include <iostream>
 using namespace std;
 
 int* sum()  //求1..100的和，是5050
 {
 int sum=0;
 int *p=&sum;
 for(int i=1;i<101;i++)
 sum+=i;
 return p;
 }
 
 int main()
 {
 int *q=sum();
 cout<<*q<<endl;  //本来你认为这里是5050，但是因为返回的是一个局部变量指针，在返回时，空间已经释放，所以这个空间存放的就不一定是5050（看是否被占用）
 return 0;
 }
*/
