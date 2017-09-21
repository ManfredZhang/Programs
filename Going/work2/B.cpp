#include <iostream>
#include <cstdio>
#include <cstring>
#include <algorithm>
#include <climits>
#define size 1001
using namespace std;

int main()
{
    int T, S, D;

    while (~scanf("%d%d%d", &T, &S, &D))
    {
        int Graph[size][size];
        int Black[size];
        int d[size];
        int Vertex[size];
//INITIALIZE
        for (int i = 0; i < size; i++)
        {
            d[i] = INT_MAX;
            Black[i] = 0;
            Vertex[i] = 0;
            for (int j = 0;j < size; j++)
                Graph[i][j] = INT_MAX;
        }
//输入
        int vex_num = 0;
        int First[size];
        memset(First,0,sizeof(First));
        for (int i = 0; i < T; i++)
        {
            int a,b,time;
            scanf("%d%d%d",&a,&b,&time);
            if (First[a]==0)
            {
                Vertex[vex_num++]=a;
                First[a]=1;
            }
            if (First[b]==0)
            {
                Vertex[vex_num++]=b;
                First[b]=1;
            }
            if (time<Graph[a][b])
            {
                Graph[a][b]=time;
                Graph[b][a]=time;
            }
        }
        for (int i = 0; i < S; i++)
        {
            int near;
            scanf ("%d",&near);
            d[near]=0;
        }
        int Dest[size];
        for (int i = 0; i < D; i++)
        {
            int end;
            scanf("%d",&end);
            Dest[i]=end;
        }
//Dijstra       
        int d_min_v;
        for (int i = 0; i < vex_num; i++)
        {
            int present_d = INT_MAX;
            for (int j = 0; j < vex_num; j++)
            {
                if (Black[Vertex[j]]==1)
                    continue;
                if (present_d > d[Vertex[j]])
                {
                    present_d = d[Vertex[j]];
                    d_min_v=Vertex[j];
                }
            }
            //priority_queue <int> Q; 

            Black[d_min_v]=1;
            for (int j = 0; j < vex_num; j++)
            {
                if (Graph[d_min_v][Vertex[j]]!=INT_MAX)
                    d[Vertex[j]]=min(d[Vertex[j]],d[d_min_v]+Graph[d_min_v][Vertex[j]]);
            }
        }

        int output=INT_MAX;
        for (int i = 0; i < D; i++)
        {
            if (d[Dest[i]]<output)
                output=d[Dest[i]];
        }
        printf("%d\n",output);
    }
    return 0;
}