/*
支持二进制存在符号位
不支持浮点数和符号数值表示法
 */
#include <iostream>
using namespace std;
int main()
{
//要求设定
	cout << "输入进制：";
	int in;
	cin >> in;

	cout << "补码位数：";
	int out = 0;
	cin >> out;

	int sign = 0;
	if (in == 2)
	{
		cout << "首位是否是符号位？(1:是，2:不是）：";
		cin >> sign;
	}

//输入
	cout << "输入：";
	int number[50] = {0};
	int count = 0;
	int countper = 0;
	cin.get();
	for (int i = 0; i < 50; ++i)
	{
		char temp;
		temp = cin.get();
		if (temp == '\n')
		{
			count = i;
			break;
		}
		else
		{
			if (temp == 'A')
				number[i] = 10;
			else if (temp == 'B')
				number[i] = 11;
			else if (temp == 'C')
				number[i] = 12;
			else if (temp == 'D')
				number[i] = 13;
			else if (temp == 'E')
				number[i] = 14;
			else if (temp == 'F')
				number[i] = 15;
			else
				number[i] = temp - '0';
		}
	}
	countper = count;

//记录最后一位非零的位置
	int flag = 0;
	for (int i = countper - 1; i >= 0; i--)
	{
		if (number[i] != 0)
		{
			flag = i;
			break;
		}
	}

//最后一位非零位之前全部取反
	for (int i = 0; i < flag; ++i)
	{
		number[i] = (in - 1) - number[i];
	}

//最后一位非零位取反加一
	number[flag] = (in - 1) - number[flag] + 1;
	
	
//特殊情况处理：0000（不进行循环取反，首位进行取反加一 = in）
	if (number[flag] == in)
	{
		number[flag] = 0;
		flag = 2 * out;//与1000情况区别
	}
//特殊情况处理：1000（四位带符号二进制数所能表示最大负数）
	if (flag == 0 && countper == out && sign == 1)
	{
		cout << "+2 ^" << out << " 无法用" << out << " 位数字表示" << endl;
		exit(0);
	}

//向前补全并输出
	cout << "输出补码：";
	if (out - countper >= 0)
	{
		if (sign == 1)
		{
			for (int i = 0; i < out - countper; ++i)
				cout << number[0];
		}
		else if (flag == 2 * out)//解决0000问题（前面不能补9）
		{
			for (int i = 0; i < out - countper; ++i)
			{
				cout << "0";
			}
		}
		else
		{
			for (int i = 0; i < out - countper; ++i)
			{
				if (in - 1 == 10)
			    	cout << "A";
		    	else if (in - 1 == 11)
		    		cout << "B";
		    	else if (in - 1 == 12)
		    		cout << "C";
		    	else if (in - 1 == 13)
		    		cout << "D";
		    	else if (in - 1 == 14)
		    		cout << "E";
		    	else if (in - 1 == 15)
		    		cout << "F";
		    	else
		    		cout << in - 1;
			}
		}
	}
	else
	{
		cout << "位数不够，无法表示";
		exit(0);
	}
	
	
	for (int i = 0; i < countper; ++i)
	{
		if (number[i] == 10)
	    	cout << "A";
    	else if (number[i] == 11)
    		cout << "B";
    	else if (number[i] == 12)
    		cout << "C";
    	else if (number[i] == 13)
    		cout << "D";
    	else if (number[i] == 14)
    		cout << "E";
    	else if (number[i] == 15)
    		cout << "F";
    	else
    		cout << number[i];
	}
	
	cout << endl;

	return 0;
}