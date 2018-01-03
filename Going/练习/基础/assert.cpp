#include <iostream>
//#define NDEBUG  //调试完成后添加这条语句可disable所有assert免得影响程序效率
#include <cassert>
using namespace std;
int main()
{
	int a;
	for (a = 0 ; a < 8; a++)
	{
		cout << a << endl;
		assert(a < 5);
	}
	return 0;
}
