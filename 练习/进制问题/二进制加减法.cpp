/*二进制补码加减法
支持首位符号位，-(-8) == +8
不支持小数，无符号二进制*/

#include <iostream>
using namespace std;
int main()
{
//初始化
	cout << "输入二进制数1：";
	int number1[50] = {0};
	int count1 = 0;
	int count1per = 0;
	for (int i = 0; i < 50; ++i)
	{
		char temp;
		temp = cin.get();
		if (temp == '\n')
		{
			count1 = i;
			break;
		}
		else
		{
			if (temp == 'A')
				number1[i] = 10;
			else if (temp == 'B')
				number1[i] = 11;
			else if (temp == 'C')
				number1[i] = 12;
			else if (temp == 'D')
				number1[i] = 13;
			else if (temp == 'E')
				number1[i] = 14;
			else if (temp == 'F')
				number1[i] = 15;
			else
				number1[i] = temp - '0';
		}
	}
	count1per = count1;

	cout << "输入运算符（+/-）：";
	char x;
	cin >> x;

	cout << "输入二进制数2：";
	cin.get();
	int number2[50] = {0};
	int count2 = 0;
	int count2per = 0;
	for (int i = 0; i < 50; ++i)
	{
		char temp;
		temp = cin.get();
		if (temp == '\n')
		{
			count2 = i;
			break;
		}
		else
		{
			if (temp == 'A')
				number2[i] = 10;
			else if (temp == 'B')
				number2[i] = 11;
			else if (temp == 'C')
				number2[i] = 12;
			else if (temp == 'D')
				number2[i] = 13;
			else if (temp == 'E')
				number2[i] = 14;
			else if (temp == 'F')
				number2[i] = 15;
			else
				number2[i] = temp - '0';
		}
	}
	count2per = count2;

	if (count1 != count2)
	{
		cout << "error: 请输入两个同位数来运算" << endl;
		exit(0);
	}

//减号则取补
	int flag = 0;
	if (x == '-')
	{
	//记录最后一位非零的位置
		for (int i = count2per - 1; i >= 0; i--)
		{
			if (number2[i] != 0)
			{
				flag = i;
				break;
			}
		}

	//最后一位非零位之前全部取反
		for (int i = 0; i < flag; ++i)
		{
			number2[i] = (2 - 1) - number2[i];
		}

	//最后一位非零位取反加一
		number2[flag] = (2 - 1) - number2[flag] + 1;
		
		
	//特殊情况处理：0000（不进行循环取反，首位进行取反加一 = 2）
		if (number2[flag] == 2)
		{
			number2[flag] = 0;
			flag = 2 * count2per;//与1000情况区别
		}
	//注意1000可以取反成1000，只要不溢出结果就是正确的，flag还是0，判断溢出时会用到
		if (flag == 0 && number1[0] == 0)//减1000的若是非负数则溢出
		{
			cout << "error: 溢出，结果无法表示" << endl; 
			exit(0);
		}
	}

//相加
	int *number3 = new int[count1per];
	for (int i = 0; i < count1per; ++i)
		number3[i] = 0;
	int n = count1per - 1;
	while (n >= 0)
	{
		number3[n] += number1[n] + number2[n];
		if (number3[n] == 2)
		{
			number3[n] = 0;
			if (n-1 >= 0)
				number3[n-1] += 1;
		}
		if (number3[n] == 3)
		{
			number3[n] = 1;
			if (n-1 >= 0)
				number3[n-1] += 1;
		}

		n--;
	}

//输出结果
	if (number1[0] == number2[0] && number1[0] != number3[0] && flag != 0)
		cout << "error: 溢出，结果无法表示"; 
	else
	{
		cout << endl << "输出结果：";
		for (int i = 0; i < count1per; ++i)
			cout << number3[i];
	}

cout << endl;
return 0;
}