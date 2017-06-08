#include <iostream>
#include <climits>
#include <queue>
using namespace std;

struct NODE
{
	int colour; //WHITE = 0 GRAY = 1 BLACK = 2
	int d;
	NODE *pi;
};

int main()
{
	int v_num;
	cin >> v_num;
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

	//cout << matrix[v_num - 1][v_num - 1] << endl;
	
	NODE *Vertex = new NODE[v_num];
	for (int i = 0; i < v_num; ++i)
	{
		Vertex[i].colour = 0;
		Vertex[i].d = INT_MAX;
		Vertex[i].pi = NULL;
	}

	Vertex[v_start].colour = 1;
	Vertex[v_start].d = 0;

	queue <NODE*> Q;

	Q.push(&Vertex[v_start]);

	while (Vertex.size() != 0)
	{
		NODE u = Q.front();
		for (int i = 0; i < v_num; ++i)
		{
			/* code */
		}
	}
	

	return 0;
}