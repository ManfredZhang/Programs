//数组初始化的几种方法

#include <iostream>
using namespace std;
int main()
{
	//法1
	int *table = new int[100](); //后面加一对括号即可

	//法2
	memset(table, 0, sizeof(int) * 100);	//memset(数组名，初始化的数，以字节为单位的大小）
	//memset(table, 0, sizeof(table));	错误！ 
	
	return 0;
}
