#include <iostream>
#include <queue>
#include <algorithm>
#include <cstring>
#include <cmath>
#include <iomanip>
using namespace std;

/*
S棵卫星，P个村庄。有卫星的村庄间可以任意通信，否则村庄只能和距离小于D的村庄通信；
求出D的最小值；
显然D越小，就需要更大的卫星数量S；
S棵卫星的存在允许存在S个连通分量；
把最大的那S-1个连线砍掉，就形成S个联通分量，其中具有最小的D；
转为求第S长的连线；
可以用数组从小到大存储最小生成树的连线长度，共P-1条；
第S长的连线即数组的第P-S-1号元素；
*/

//可以使用更经常使用的向量形式加以实现；

int father[510]; //储存每个村庄的根；
double d[510]; //从大到小存储边的长度；
int m, k;
struct post
{
    double x, y;
}p[510];

struct edge{
    int u, v;
    double w;
}e[500000];

bool cmp(edge e1, edge e2)
{
    return e1.w < e2.w;
}

double dis(double x1, double y1, double x2, double y2)
{
    return sqrt((x1 - x2) * (x1 - x2) + (y1 - y2) * (y1 - y2));
}

void Init(int n)
{ //认己作父；
    for (int i = 1; i <= n; i++)
        father[i] = i;
}

int Find(int x)
{ //返回根节点；
    if (x != father[x])
        father[x] = Find(father[x]);
    return father[x];
}

void Merge(int a, int b)
{ //合并两个集合；
    int p = Find(a);
    int q = Find(b);
    if (p == q)
        return;
    father[p] = q;
}

void Kruskal(int n)
{ //将满足条件的边的长度放入数组d中；
    k = 0;
    for (int i = 0; i < m; i++)
    {
        if (Find(e[i].u) != Find(e[i].v))
        {
            Merge(e[i].u, e[i].v);
            d[k++] = e[i].w;
            n--;
            if (n == 1)
                return;
        }
    }
}

int main()
{
    int t, S, P;
    double x, y;
    cin >> t;
    while (t--)
    {
        m = 0;
        cin >> S >> P;
        Init(P);
        for (int i = 1; i <= P; i++)
        {
            cin >> p[i].x >> p[i].y;
        }
        for (int i = 1; i <= P; i++)
        {
            for (int j = i + 1; j <= P; j++)
            { //相当于edges.push_back()；
                e[m].u = i;
                e[m].v = j;
                e[m++].w = dis(p[i].x, p[i].y, p[j].x, p[j].y);
                e[m].u = j;
                e[m].v = i;
                e[m++].w = dis(p[i].x, p[i].y, p[j].x, p[j].y);
            }
        }
        sort(e, e+m, cmp);
        Kruskal(P);
        cout << fixed << setprecision(2) << d[P - S - 1] << endl;
    }
    return 0;
}
