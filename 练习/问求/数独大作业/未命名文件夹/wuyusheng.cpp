#include <iostream>
#include <vector>
#include <algorithm>
#include <time.h>
using namespace std;

struct scondition
{
	int sline, srow, snum;
};
//现实数独的一个条件（行，列，数字）

vector <vector <int> > psudoku(729, vector<int>(324, 0));
vector<int> solve;
vector<int> lineinuse;
vector<int> rowinuse;
//定义全局变量：程序矩阵；存放代表解的行数；存放需要考虑的行数；存放需要考虑的列数

int realtopro(scondition a)
{
	int i = (a.sline - 1) * 81 + (a.srow - 1) * 9 + a.snum - 1;
	return i;
} 
//把现实数独的一个条件转换成程序矩阵中对应的行

scondition protoreal(int i)
{
	scondition a;
	a.sline = i / 81 + 1;
	a.srow= (i % 81) / 9 + 1;
	a.snum= i % 9 + 1;
	return a;
}
//把程序矩阵的一行转换成对应的现实数独的一个条件

void pdelete(int i)
{
	vector<int> row;
	vector<int>::iterator it = rowinuse.begin();
	for (; it != rowinuse.end(); )
	{
		if (psudoku[i][*it] == 1)
		{
			row.push_back(*it);
			it = rowinuse.erase(it);
		}
		else
			it++;
	}
	for (it = row.begin(); it != row.end();it++)
	{
		vector<int>::iterator it1 = lineinuse.begin();
		for (; it1 != lineinuse.end();)
		{
			if (psudoku[*it1][*it] == 1)
				it1 = lineinuse.erase(it1);
			else
				it1++;
		}
	}
}
//对给定的程序矩阵中行数i，执行比较删除。删除相关行和列。将删除的行数和列数储存在a，b中

void pinitial()
{
	solve.clear();
	lineinuse.clear();
	rowinuse.clear();
	for (int i = 0; i < 324; i++)
		rowinuse.push_back(i);
	for (int i = 0; i < 729; i++)
	{
		lineinuse.push_back(i);
		int line = i / 81 + 1;
		int row = (i % 81) / 9 + 1;
		int num = i % 9 + 1;
		int palace;
		if (line == 1 || line == 2 || line == 3)
		{
			if (row == 1 || row == 2 || row == 3)
				palace = 1;
			else if (row == 4 || row == 5 || row == 6)
				palace = 2;
			else
				palace = 3;
		}
		else if (line == 4 || line == 5 || line == 6)
		{
			if (row == 1 || row == 2 || row == 3)
				palace = 4;
			else if (row == 4 || row == 5 || row == 6)
				palace = 5;
			else
				palace = 6;
		}
		else
		{
			if (row == 1 || row == 2 || row == 3)
				palace = 7;
			else if (row == 4 || row == 5 || row == 6)
				palace = 8;
			else
				palace = 9;
		}
		int plocation[4];
		plocation[0] = (line - 1) * 9 + row - 1;
		plocation[1] = (line - 1) * 9 + num + 80;
		plocation[2] = (row - 1) * 9 + num + 161;
		plocation[3] = (palace - 1) * 9 + num + 242;
		for (int p = 0; p < 4; p++)
			psudoku[i][plocation[p]] = 1;
	}
}
//以上初始化了需要考虑的列数，程序矩阵，需要考虑的行数

int firststep(vector<int> &a)
{
	vector<int>::iterator it = a.begin();
	for (; it != a.end(); it++)
	{
		if (find(lineinuse.begin(), lineinuse.end(), *it) != lineinuse.end())
			pdelete(*it);
		else
			return -1;
	}
	return 1;
}
//对题目条件进行处理

int psolving()
{
	if (lineinuse.empty() || rowinuse.empty())
		return 3;
	//以上 若矩阵空了，返回3
	else
	{
		vector<int>::iterator  itline, itrow;
		int flag;
		for (itline = lineinuse.begin(); itline != lineinuse.end(); itline++)
		{
			flag = 1;
			for (itrow = rowinuse.begin(); itrow != rowinuse.end(); itrow++)
				if (psudoku[*itline][*itrow] == 0)
					flag = 0;
			if (flag == 1)
			{
				solve.push_back(*itline);
				return 2;
			}
		}
		//以上 判断矩阵中是否有全部为1的行，若有则返回2
		vector<int>::iterator minrow;
		int min = 10;
		for (itrow = rowinuse.begin(); itrow != rowinuse.end(); itrow++)
		{
			int sum = 0;
			for (itline = lineinuse.begin(); itline != lineinuse.end(); itline++)
				sum += psudoku[*itline][*itrow];
			if (sum == 0)
				return 3;
			else if (sum == 1)
			{
				minrow = itrow;
				break;
			}
			else if (sum < min)
			{
				minrow = itrow;
				min = sum;
			}
		}
		//以上 判断矩阵中是否有全部为0的列，若有则返回3；同时找出含1的个数最少的列，存在minrow中
		vector<int> line1;
		for (itline = lineinuse.begin(); itline != lineinuse.end(); itline++)
			if (psudoku[*itline][*minrow] == 1)
				line1.push_back(*itline);
		//以上 从矩阵中找出所有minrow列是1的行，存在line1中，接下来对line1中存的行逐个尝试
		itline = line1.begin();
		
		vector<int> linecopy, rowcopy;
		linecopy = lineinuse;
		rowcopy = rowinuse;
		//以上 拷贝一下lineinuse和rowinuse，发现错了回溯时用来还原
		int ans = *itline;
		pdelete(*itline);
		int note2 = psolving();
		//以上 用ans记录下此次选的行数备用，若正确则存入solve；然后执行pdelete；再调用递归，用note2接受递归结果
		/*递归结果的表示：
		return 2：问题已解决；
		return 3：问题无解，需要更换所选行。
		*/
		while (1)
		{
			if (note2 == 2)
			{
				solve.push_back(ans);
				return 2;
			}
			//以上 若下级递归返回2说明问题已解决；此时，存好ans并向上返回2
			else 
			{
				lineinuse = linecopy;
				rowinuse = rowcopy;
				if ((itline+1)!=line1.end())
				{
					itline++;
					ans = *itline;
					pdelete(*itline);
					note2 = psolving();
				}
				else
					return 3;
			}
		   //以上 表示这次的选择会导致接下来无解，所以重置矩阵，更换至line1中的下一行进行尝试；若line1被试完了还是不行，说明是上一级的选择导致了无解，向上传递3
		}
	}
}
//以上 是核心的递归部分

void partsolve()
{
		pinitial();
		//以上 初始化几个全局数组
		vector<int> condition;
		scondition input, output;
		int n;
		char c;
		for (int i = 0; i < 81; i++)
		{
			cin >> c;
			n = c - '0';
			if (n != 0)
			{
				input.sline = i / 9 + 1;
				input.srow = i % 9 + 1;
				input.snum = n;
				condition.push_back(realtopro(input));
			}
		}
		//以上 读入一个数独
		if (firststep(condition) == -1)
		{
			cout << "no answer\n";
			return ;
		}
		//以上 处理题目条件
		if (psolving() == 3)
		{
			cout << "no answer\n";
			return ;
		}
		//以上 解题
		vector<int>::iterator  iitt;
		for (iitt = condition.begin(); iitt != condition.end(); iitt++)
		{
			solve.push_back(*iitt);
		}
		//以上 将题目条件也放到最后的解中，因为要输出完整的数独
		vector<vector<int> > realsolve;
		realsolve.resize(9);
		for (int i = 0; i < 9; i++)
			realsolve[i].resize(9);
		//用realsolve来存储答案数独
		iitt = solve.begin();
		for (; iitt != solve.end(); iitt++)
		{
			output = protoreal(*iitt);
			realsolve[output.sline - 1][output.srow - 1] = output.snum;
		}
		//把solve中的行数转换成现实数独的信息填入realsolve
		for (int i = 0; i < 81; i++)
		{
			cout << realsolve[i / 9][i % 9];
			if (i % 9 == 8)
				cout << endl;
		}
		//输出realsolve
}
//以上 是解数独部分的程序

void partasking()
{
	pinitial();
	vector<int> randomlist = { 1,2,3,4,5,6,7,8,9 };
	srand((unsigned)time(NULL));
	random_shuffle(randomlist.begin(), randomlist.end());
	scondition input, output;
	vector<int> condition;
	for (int i = 1; i < 10; i++)
	{
		input.sline = 1;
		input.srow = i;
		input.snum = randomlist[i - 1];
		condition.push_back(realtopro(input));
	}
	firststep(condition);
	psolving();
	vector<int>::iterator  iitt;
	for (iitt = condition.begin(); iitt != condition.end(); iitt++)
	{
		solve.push_back(*iitt);
	}
	//以上 随机生成了一个数独，以行数的形式储存在solve中
	sort(solve.begin(), solve.end());
	vector<int> stdanswer = solve;
	//以上 确立答案
	random_shuffle(solve.begin(), solve.end());
	iitt = solve.begin();
	int diffi;
	cout << "how difficult do you expect?\n";
	cout << "from 1 to 5 ,the bigger the num, the more challenging the problem\n";
	cin >> diffi;
	diffi *= 10;
	for (int i = 0; i < diffi; i++)
		iitt = solve.erase(iitt);
	vector<vector<int> >realsolve(9, vector<int>(9, 0));
	iitt = solve.begin();
	for (; iitt != solve.end(); iitt++)
	{
		output = protoreal(*iitt);
		realsolve[output.sline - 1][output.srow - 1] = output.snum;
	}
	for (int i = 0; i < 81; i++)
	{
		cout << realsolve[i / 9][i % 9];
		if (i % 9 == 8)
			cout << endl;
	}
	//以上 随机扣掉29个数打印出题目
	cout << "enter your answer\n";
	vector<int> answer;
	int n;
	char c;
	int mark = 0;
	while (mark == 0)
	{
		for (int i = 0; i < 81; i++)
		{
			cin >> c;
			n = c - '0';
			if (n != 0)
			{
				input.sline = i / 9 + 1;
				input.srow = i % 9 + 1;
				input.snum = n;
				answer.push_back(realtopro(input));
			}
		}
		//以上 读取用户的答案
		sort(answer.begin(), answer.end());
		for (int i = 0; i < 81; i++)
			if (stdanswer[i] != answer[i])
			{
				cout << "wrong!\n" << "1.check the answer\n" << "2.try again\n";
				cin >> n;
				if (n == 1)
				{
					iitt = stdanswer.begin();
					for (; iitt != stdanswer.end(); iitt++)
					{
						output = protoreal(*iitt);
						realsolve[output.sline - 1][output.srow - 1] = output.snum;
					}
					for (int i = 0; i < 81; i++)
					{
						cout << realsolve[i / 9][i % 9];
						if (i % 9 == 8)
							cout << endl;
					}
					mark = 1;
				}
				else
					cout << "enter another time\n";
				break;
			}
	}
}
//以上 出题部分

int main()
{
	int choice = 1;
	cout << "what do you want?\n";
	while (1)
	{
		cout << "1.solve a sudoku\n" << "2.do a sudoku\n"<<"0.exit\n";
		cin >> choice; 
		if (choice == 1)
		{
			cout << "you chose the solving mode, enter the problem:\n";
			partsolve();
			cout << "done!\n";
		}
		else if (choice == 2)
		{
			partasking();
		}
		else
			break;
		cout << "what's next?\n";
	}

	return 0;
}