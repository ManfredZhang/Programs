#include <iostream>
#include <climits>
#include <queue>
using namespace std;

struct NODE
{
	int colour; //WHITE = 0 GRAY = 1 BLACK = 2
	int d;
	int f;
	int index;
	NODE *pi;
};

int timing = 0;

void DFS_VISIT(NODE *Vertex, int u, int v_num, int **matrix)
{
	timing = timing + 1;
	Vertex[u].d = timing;
	Vertex[u].colour = 1;
	for (int i = 0; i < v_num; ++i)
	{
		if (matrix[u][i] > 0)
		{
			if (Vertex[i].colour == 0)
			{
				Vertex[i].pi = &Vertex[u];
				DFS_VISIT(Vertex, i, v_num, matrix);
			}
		}
	}
	Vertex[u].colour = 2;
	timing = timing + 1;
	Vertex[u].f = timing;
}

int main()
{
	int v_num;
	while (cin >> v_num)
	{
		int v_start;
		cin >> v_start;

		int **matrix = new int *[v_num];
		for (int i = 0; i < v_num; ++i)
			matrix[i] = new int[v_num];

		for (int i = 0; i < v_num; ++i)
		{
			for (int j = 0; j < v_num; ++j)
				cin >> matrix[i][j];
		}

		
	//BFS	
		NODE *bucunzaide = new NODE;
		NODE *Vertex = new NODE[v_num];
		for (int i = 0; i < v_num; ++i)
		{
			Vertex[i].colour = 0;
			Vertex[i].d = INT_MAX;
			Vertex[i].pi = bucunzaide;
			Vertex[i].index = i;
		}

		Vertex[v_start].colour = 1;
		Vertex[v_start].d = 0;
		Vertex[v_start].pi = bucunzaide;

		queue <NODE*> Q;

		Q.push(&Vertex[v_start]);

		while (Q.size() != 0)
		{
			NODE *u = Q.front();
			Q.pop();
			for (int i = 0; i < v_num; ++i)
			{
				if (matrix[u->index][i] > 0)
				{
					if (Vertex[i].colour == 0)
					{
						Vertex[i].colour = 1;
						Vertex[i].d = u->d + 1;
						Vertex[i].pi = u;
						Q.push(&Vertex[i]);
					}
					//cout << i << " ";
				}
			}
			u->colour = 2;
			//cout << endl;
		}

		for (int i = 0; i < v_num; ++i)
		{
			cout << i << " ";
			if (Vertex[i].d != INT_MAX)
				cout << Vertex[i].d << " ";
			else
				cout << "9999" << " ";
			if (Vertex[i].pi != bucunzaide)
				cout << Vertex[i].pi->index << endl;
			else
				cout << "-1" << endl;
		}


	//DFS
		for (int i = 0; i < v_num; ++i)
		{
			Vertex[i].colour = 0;
			Vertex[i].d = INT_MAX;
			Vertex[i].pi = bucunzaide;
			Vertex[i].index = i;
		}

		timing = 0;
		for (int i = 0; i < v_num; ++i)
		{
			if (Vertex[i].colour == 0)
			{
				DFS_VISIT(Vertex, i, v_num, matrix);
			}
		}

		for (int i = 0; i < v_num; ++i)
		{
			cout << i << " ";
			cout << Vertex[i].d << " ";
			cout << Vertex[i].f << endl;
		}
	}
	

	return 0;
}