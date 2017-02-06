#include <iostream>
using namespace std;
int main()
{
	struct hello
	{
		int hi;
		char *name;
        string s;
        char name2[20];
        int *p;
	}s1,s2;

	s1.hi = 1000;
	s1.p  = &s1.hi;

//相互赋值
	s2 = s1;//相同结构类型的不同变量之间可以直接相互赋值，
	//其实质是两个结构变量相应的存储空间中的所有成员数据直接拷贝

	//typedef的两个结构算是相同结构类型
	//另外定义的一样的结构不算相同结构类型
	typedef hello go;
	hello h1;
	go h2;
	h1 = h2;

	struct hu
	{
		int hi;
		int *p;
		char name[20];
	}k;

	//k = s1;	error
    hello str = {1, "asdasd" , "hey", "hu"};
    
	cout << str.name << endl;
	cout << str.s << endl;
	cout << str.name2 << endl;
    
    
    
    
	return 0;
}
