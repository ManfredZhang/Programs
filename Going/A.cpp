#include <iostream>
#include <climits>
#include <queue>
#include <vector>
using namespace std;

struct Farm
{
	int num;
	int d;
	Farm *pi;
};

struct CMP
{
	bool operator()(Farm *a,Farm *b) { return  a->d > b->d; }
};

void INITIALIZE(Farm *G, int farmnum)
{
	for (int i = 0; i < farmnum; ++i)
	{
		G[i].num = i;
		G[i].d = INT_MAX;
		G[i].pi = NULL;
	}
	G[0].d = 0;
}

void RELAX(Farm *Node_u, Farm *Node_v, int w)
{
	if (Node_v -> d > Node_u -> d + w)
		Node_v -> d = Node_u -> d + w;
	Node_v -> pi = Node_u;
}

void DIJKSTRA(Farm *G, int **Array, int farmnum)
{
	INITIALIZE(G, farmnum);

	priority_queue<int, vector<Farm*>, CMP> PRIQ;

	for (int i = 0; i < farmnum; ++i)
		PRIQ.push(&G[i]);

	while (PRIQ.size() != 0)
	{	
		for (int i = 0; i < farmnum; ++i)
		{
			//cout << PRIQ.top() -> num << endl;
			RELAX(PRIQ.top(), &G[i], Array[PRIQ.top()->num][i]);
			//cout << Array[PRIQ.top()->num][i] << endl;
			//cout << G[i].d << endl;
		}
		PRIQ.pop();
	}
}

int main()
{
	int farmnum = 0;
	cin >> farmnum;

	int **Array = new int *[farmnum];  
    for (int i = 0; i < farmnum; i++)  
        Array[i] = new int[farmnum]; 

	for (int i = 0; i < farmnum; ++i)
		for (int j = 0; j < farmnum; ++j)
			cin >> Array[i][j];

	Farm *G = new Farm[farmnum];

	DIJKSTRA(G, Array, farmnum);

	int total = 0;

	for (int i = 0; i < farmnum; ++i)
	{
		total += G[i].d;
		//cout << G[i].d << endl;
	}
	
	cout << total << endl;

	return 0;
}