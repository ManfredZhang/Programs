#include <iostream>
#include <cstring>
#include <climits>
#include <vector>
#include <queue>
using namespace std;

struct EdgeStruct
{
	int v;
	int dis;
	int price;
}Edge;

int main()
{
	int n,m;  //顶点个数和边数
	while(scanf("%d%d",&n,&m))
	{
	//构造Graph
		if (m == 0 && n == 0)
			break;
		vector <EdgeStruct> *Graph = new vector<EdgeStruct> [m*2];
		for (int i = 1; i <= n; i++)
			Graph[i].clear();

		for (int i = 1; i <= m; i++)
		{
			int u,v,d,p;
			scanf("%d%d%d%d",&u,&v,&d,&p);
			Edge.v = v;
			Edge.dis = d;
			Edge.price = p;
			Graph[u].push_back(Edge);
			Edge.v = u;
			Graph[v].push_back(Edge);
		}

		int s,t;
		cin >> s >> t;
	//INITIALIZE
		int *Dis = new int[m*2];
		int *Price = new int[m*2];
		for (int i = 0; i < m*2; i++)
		{
			Dis[i] = INT_MAX;
			Price[i] = INT_MAX;
		}
		Dis[s] = 0;
		Price[s] = 0;
	//SPFA算法
		queue <int> Q;
		Q.push(s);
		while (!Q.empty())
		{
			int head = Q.front();
			Q.pop();

			for (int i = 0; i < Graph[head].size(); i++)
			{
		//Relax
				if (Dis[Graph[head][i].v] > Dis[head] + Graph[head][i].dis  || ((Dis[Graph[head][i].v] == Dis[head] + Graph[head][i].dis) && (Price[head] + Graph[head][i].price < Price[Graph[head][i].v])))
				{
					Dis[Graph[head][i].v] = Dis[head] + Graph[head][i].dis;
					Price[Graph[head][i].v] = Price[head] + Graph[head][i].price;
					Q.push(Graph[head][i].v);
				}
			}
		}
		//cout << Dis[t] << " " << Price[t] << endl;
		printf("%d %d\n",Dis[t],Price[t]);
	}

	return 0;
}
