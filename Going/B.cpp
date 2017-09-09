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
                Edge[m].w = get_dis(Coor[i].x, Coor[i].y, Coor[j].x, Coor[j].y);
                m++;
                Edge[m].u = j;
                Edge[m].v = i;
                Edge[m].w = Edge[m-1].w;
                m++;
            }
        }
        sort(e, e+m, comp);
        Kruskal(P);
        printf("%.2lf\n",d[P-S-1]);
    }
    return 0;

}

#include <stdio.h>
#include <stdlib.h>
#define n 9//图中点的个数
#define max 100
struct edge{
    int u;//起点
    int v;//终点
    int value;//边的权值
}e[max];
int p[max];//用于记录最小生成树的边
int father[n];//father[x]表示x的父节点；
int rank[n];//rank[x]表示x的秩，从x到其某一后代叶节点的最长路径上边的数目
int cmp(const void *a,const void *b)
{
    return ((*(edge*)a).value > (*(edge*)b).value ? 1:-1);
}
/*----------------------并查集的基本操作--------------------------*/
void makeSet()//初始化集合
{
    for(int i=0;i<n;i++)
    {
        father[i]=i;
        rank[i]=0;
    }
}
int findSet(int x)//寻找x所在集合，回溯时压缩路径
{
    if(x!=father[x])
        father[x]=findSet(father[x]);
    return(father[x]);
}
void unionSet(int x,int y)//按秩合并x和y所在的集合
{
    if(rank[x]>rank[y])
        father[y]=x;
    else if(rank[x]<rank[y])
        father[x]=y;
    else 
    {
        rank[y]++;
        father[x]=y;
    }
}
/*-----------------------------主函数-------------------------------*/
int main()
{
    int i,j,x,y,h=0,sum=0,k=0;
    //en表示各个点之间的连接情况，为0表示无边，其他值表示边的权值
    int en[n][n]={{0,4,0,0,0,0,0,8,0},
            {4,0,8,0,0,0,0,11,0},
            {0,8,0,7,0,4,0,0,2},
            {0,0,7,0,9,14,0,0,0},
            {0,0,0,9,0,10,0,0,0},
            {0,0,4,14,10,0,2,0,0},
            {0,0,0,0,0,2,0,1,6},
            {8,11,0,0,0,0,1,0,7},
            {0,0,2,0,0,0,6,7,0}};
    
    for(i=0;i<n;i++)//各个边的初始化
        for(j=i;j<n;j++)
        {
            if(en[i][j]!=0)
            {
                e[k].u=i;
                e[k].v=j;
                e[k].value=en[i][j];
                k++;
            }
        }
    makeSet();//初始化集合
    qsort(e,k,sizeof(struct edge),cmp);//按照边的权值非递减顺序对边进行排序
    for(i=0;i<k;i++)
    {
        x=findSet(e[i].u);//寻找x所在集合的标志点
        y=findSet(e[i].v);//寻找y所在集合的标志点
        if(x!=y)//x和y不属于同一个集合
        {
            unionSet(x,y);//进行x和y所在集合的合并操作
            sum+=e[i].value;//将该边的权值计入总代价
            p[h++]=i;
        }
        else{}
    }
    printf("最小生成树的代价为：%d\n",sum);
    printf("最小生成树的各边及权值依次为：\n");
    for(i=0;i<h;i++)
        printf("边%c - %c 权值:%d \n",e[p[i]].u+'a',e[p[i]].v+'a',e[p[i]].value);
}