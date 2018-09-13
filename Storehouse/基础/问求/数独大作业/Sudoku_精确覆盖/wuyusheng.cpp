#include <iostream>
#include <vector>
#include <algorithm>
#include <time.h>
using namespace std;

struct scondition
{
	int sline, srow, snum;
};
//��ʵ������һ���������У��У����֣�

vector <vector <int> > psudoku(729, vector<int>(324, 0));
vector<int> solve;
vector<int> lineinuse;
vector<int> rowinuse;
//����ȫ�ֱ�����������󣻴�Ŵ����������������Ҫ���ǵ������������Ҫ���ǵ�����

int realtopro(scondition a)
{
	int i = (a.sline - 1) * 81 + (a.srow - 1) * 9 + a.snum - 1;
	return i;
} 
//����ʵ������һ������ת���ɳ�������ж�Ӧ����

scondition protoreal(int i)
{
	scondition a;
	a.sline = i / 81 + 1;
	a.srow= (i % 81) / 9 + 1;
	a.snum= i % 9 + 1;
	return a;
}
//�ѳ�������һ��ת���ɶ�Ӧ����ʵ������һ������

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
//�Ը����ĳ������������i��ִ�бȽ�ɾ����ɾ������к��С���ɾ��������������������a��b��

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
//���ϳ�ʼ������Ҫ���ǵ����������������Ҫ���ǵ�����

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
//����Ŀ�������д���

int psolving()
{
	if (lineinuse.empty() || rowinuse.empty())
		return 3;
	//���� ��������ˣ�����3
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
		//���� �жϾ������Ƿ���ȫ��Ϊ1���У������򷵻�2
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
		//���� �жϾ������Ƿ���ȫ��Ϊ0���У������򷵻�3��ͬʱ�ҳ���1�ĸ������ٵ��У�����minrow��
		vector<int> line1;
		for (itline = lineinuse.begin(); itline != lineinuse.end(); itline++)
			if (psudoku[*itline][*minrow] == 1)
				line1.push_back(*itline);
		//���� �Ӿ������ҳ�����minrow����1���У�����line1�У���������line1�д�����������
		itline = line1.begin();
		
		vector<int> linecopy, rowcopy;
		linecopy = lineinuse;
		rowcopy = rowinuse;
		//���� ����һ��lineinuse��rowinuse�����ִ��˻���ʱ������ԭ
		int ans = *itline;
		pdelete(*itline);
		int note2 = psolving();
		//���� ��ans��¼�´˴�ѡ���������ã�����ȷ�����solve��Ȼ��ִ��pdelete���ٵ��õݹ飬��note2���ܵݹ���
		/*�ݹ����ı�ʾ��
		return 2�������ѽ����
		return 3�������޽⣬��Ҫ������ѡ�С�
		*/
		while (1)
		{
			if (note2 == 2)
			{
				solve.push_back(ans);
				return 2;
			}
			//���� ���¼��ݹ鷵��2˵�������ѽ������ʱ�����ans�����Ϸ���2
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
		   //���� ��ʾ��ε�ѡ��ᵼ�½������޽⣬�������þ��󣬸�����line1�е���һ�н��г��ԣ���line1�������˻��ǲ��У�˵������һ����ѡ�������޽⣬���ϴ���3
		}
	}
}
//���� �Ǻ��ĵĵݹ鲿��

void partsolve()
{
		pinitial();
		//���� ��ʼ������ȫ������
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
		//���� ����һ������
		if (firststep(condition) == -1)
		{
			cout << "no answer\n";
			return ;
		}
		//���� ������Ŀ����
		if (psolving() == 3)
		{
			cout << "no answer\n";
			return ;
		}
		//���� ����
		vector<int>::iterator  iitt;
		for (iitt = condition.begin(); iitt != condition.end(); iitt++)
		{
			solve.push_back(*iitt);
		}
		//���� ����Ŀ����Ҳ�ŵ����Ľ��У���ΪҪ�������������
		vector<vector<int> > realsolve;
		realsolve.resize(9);
		for (int i = 0; i < 9; i++)
			realsolve[i].resize(9);
		//��realsolve���洢������
		iitt = solve.begin();
		for (; iitt != solve.end(); iitt++)
		{
			output = protoreal(*iitt);
			realsolve[output.sline - 1][output.srow - 1] = output.snum;
		}
		//��solve�е�����ת������ʵ��������Ϣ����realsolve
		for (int i = 0; i < 81; i++)
		{
			cout << realsolve[i / 9][i % 9];
			if (i % 9 == 8)
				cout << endl;
		}
		//���realsolve
}
//���� �ǽ��������ֵĳ���

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
	//���� ���������һ������������������ʽ������solve��
	sort(solve.begin(), solve.end());
	vector<int> stdanswer = solve;
	//���� ȷ����
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
	//���� ����۵�29������ӡ����Ŀ
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
		//���� ��ȡ�û��Ĵ�
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
//���� ���ⲿ��

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