#include <iostream>
#include <algorithm>
#include <cmath>
#include <iomanip>  
#include <queue>    
#include <cstring>  
using namespace std;

struct CoorStruct
{
    double x, y;
};

struct EdgeStruct{
    int u, v;
    double w;
}Edge[500000];

bool CMP(EdgeStruct e1, EdgeStruct e2)
{
    return e1.w < e2.w;
}

double GET_DIS(double x1, double y1, double x2, double y2)
{
    return sqrt(pow((x1 - x2),2) + pow((y1 - y2),2));
}

void INIT(int n, int *Pi)
{ 
    for (int i = 1; i <= n; i++)
        Pi[i] = i;
}

int FIND(int x, int *Pi)
{
    if (x != Pi[x])
        Pi[x] = FIND(Pi[x], Pi);
    return Pi[x];
}

void MERGE(int a, int b, int *Pi)
{
    int p = FIND(a, Pi);
    int q = FIND(b, Pi);
    if (p == q)
        return;
	else
	{	
		Pi[p] = q;
		return;
	}	
}

void KRUSKAL(int n, int m, int *Pi, double *d)
{
    int k = 0;
    for (int i = 0; i < m; i++)
    {
        if (FIND(Edge[i].u, Pi) != FIND(Edge[i].v, Pi))
        {
            MERGE(Edge[i].u, Edge[i].v, Pi);
            d[k++] = Edge[i].w;
            n--;
            if (n == 1)
                return;
        }
    }
}

int main()
{
    int casenum, snum, pnum;
    double x, y;
    cin >> casenum;
    while (casenum--)
    {
        int m = 0;
        cin >> snum >> pnum;
        int *Pi = new int[pnum];
        double *d = new double[pnum];
        CoorStruct *Coor = new CoorStruct[pnum+1];
        INIT(pnum, Pi);
        for (int i = 1; i <= pnum; i++)
            cin >> Coor[i].x >> Coor[i].y;
        for (int i = 1; i <= pnum; i++)
        {
            for (int j = i + 1; j <= pnum; j++)
            {
                Edge[m].u = i;
                Edge[m].v = j;
                Edge[m++].w = GET_DIS(Coor[i].x, Coor[i].y, Coor[j].x, Coor[j].y);
                Edge[m].u = j;
                Edge[m].v = i;
                Edge[m++].w = Edge[m - 1].w; 
			}
        }
        sort(Edge, Edge+m, CMP);
        KRUSKAL(pnum, m, Pi, d);
        cout << fixed << setprecision(2) << d[pnum - snum - 1] << endl;
    }
    return 0;
}  
