#include <iostream>
#include <cmath>
using namespace std;

struct CoorStruct
{
    double x, y;
};

struct EdgeStruct
{
    int u, v;
    double w;
};

double get_dis(double x1, double y1, double x2, double y2)
{
    return sqrt(pow((x1-x2),2) + pow((y1-y2),2));
}

int main()
{
	int casenum;
	int satellites, locations;
	cin >> casenum;

	while(casenum--)
    {
        int m = 0;
        cin >> satellites >> locations;
        //Init(P);

        CoorStruct *Coor = new CoorStruct[locations+1];

        for(i = 1; i <= locations; i++)
            cin >> Coor[i].x >> Coor[i].y;

        EdgeStruct *Edge = new EdgeStruct[locations * (locations - 1)];

        for(i = 1; i <= locations; i++)
        {
            for(j = i + 1; j <= locations; j++)
            {
                Edge[m].u = i;
                Edge[m].v = j;
                Edge[m++].w = get_dis(Coor[i].x, Coor[i].y, Coor[j].x, Coor[j].y);
                Edge[m].u = j;
                Edge[m].v = i;
                Edge[m++].w = get_dis(Coor[i].x, Coor[i].y, Coor[j].x, Coor[j].y);
            }
        }
        sort(e, e+m, comp);
        Kruskal(P);
        printf("%.2lf\n",d[P-S-1]);
    }
    return 0;

}