#include <iostream>
#include <queue>
#include <vector>
using namespace std;

struct NODE
{
	int fre;
	NODE* left;
	NODE* right;
	NODE* parent;
	bool isroot;
	int depth;
};

struct CMP
{
	bool operator()(NODE *a,NODE *b) { return  a->fre > b->fre; }
};

int main()
{
	int n;
	while (cin >> n)
	{

		//int *num = new int[n];
		int *Fre = new int[n];
		int useless;
		for (int i = 0; i < n; ++i)
		{
			cin >> Fre[i];
			cin >> useless;
		}

		NODE *Key = new NODE[n];
		for (int i = 0; i < n; ++i)
		{
			Key[i].fre = Fre[i];
		}

		priority_queue<int, vector<NODE*>, CMP> PRIQ;

		for (int i = 0; i < n; ++i)
		{
			PRIQ.push(&Key[i]);
		}

		//cout << PRIQ.top() -> fre << endl;

		NODE *Bing = new NODE[n - 1];

		for (int i = 0; i < n - 1; ++i)
		{
			Bing[i].left = PRIQ.top();
			PRIQ.top()->parent = &Bing[i];
			PRIQ.pop();
			Bing[i].right = PRIQ.top();
			PRIQ.top()->parent = &Bing[i];
			PRIQ.pop();
			Bing[i].fre = Bing[i].left->fre + Bing[i].right->fre;
			//cout << Bing[i].fre << endl;
			PRIQ.push(&Bing[i]);
			Bing[i].isroot = false;
		}
		Bing[n - 2].isroot = true;

		for (int i = 0; i < n; ++i)
		{
			Key[i].depth = 0;
			NODE *test = new NODE;
			test = &Key[i];
			while (test->isroot == false)
			{
				test = test->parent;
				Key[i].depth++;
			}
		}

		//for (int i = 0; i < n; ++i)
		//	cout << Key[i].depth << endl;
		
		int total = 0;
		for (int i = 0; i < n; ++i)
		{
			total += Key[i].depth * Key[i].fre;
		}

		cout << total << endl;
	}

	return 0;
}
