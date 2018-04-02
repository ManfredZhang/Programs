#include <iostream>
#include <cstring>
#include <cstdio>

using namespace std;

struct node {
    int id;
    int group;
    int t;
}nn[1000];

struct MAX_CLIQUE {
    static const int N=600;

    bool G[N][N];
    int n, Max[N], Alt[N][N], ans;

    bool DFS(int cur, int tot) {
        if(cur==0) {
            if(tot>ans) {
                ans=tot;
                return 1;
            }
            return 0;
        }
        for(int i=0; i<cur; i++) {
            if(cur-i+tot<=ans) return 0;
            int u=Alt[tot][i];
            if(Max[u]+tot<=ans) return 0;
            int nxt=0;
            for(int j=i+1; j<cur; j++)
                if(G[u][Alt[tot][j]]) Alt[tot+1][nxt++]=Alt[tot][j];
            if(DFS(nxt, tot+1)) return 1;
        }
        return 0;
    }

    int MaxClique() {
        ans=0, memset(Max, 0, sizeof Max);
        for(int i=n-1; i>=0; i--) {
            int cur=0;
            for(int j=i+1; j<n; j++) if(G[i][j]) Alt[1][cur++]=j;
            DFS(cur, 1);
            Max[i]=ans;
        }
        return ans;
    }
};

MAX_CLIQUE fuck;
int CNF[100][3];

int main() {
    int total = 0;
    cin >> total;
    for (int time = 0; time < total; ++time)
    {
        for (int i = 0; i < 100; ++i)
            for (int j = 0; j < 3; ++j)
                CNF[i][j] = 0;


        for (int i = 0; i < 600; ++i)
            for (int j = 0; j < 600; ++j)
                fuck.G[i][j] = 0;



        int groupp = 0;
        int node_num = 0;
        int group_num = 0;
        cin >> groupp;

        for (int i = 0; i < groupp; i++) {
            cin >> CNF[i][0] >> CNF[i][1] >> CNF[i][2];
        }

        for (int i = 0; i < groupp; ++i)
        {
            int a;
            for (int j = 0; j < 3; ++j)
            {
                a = CNF[i][j];
                nn[node_num].id = a;
                nn[node_num].group = group_num;
                if (a > 0) nn[node_num].t = 1;
                else {nn[node_num].t = 0; nn[node_num].id = -a;}
                node_num++;
            }
            group_num++;
        }

        for (int i = 0; i < node_num; ++i)
        {
            for (int j = 0; j < node_num; ++j)
            {
                if (nn[i].id == nn[j].id && nn[i].t != nn[j].t) continue;
                if (nn[i].group == nn[j].group) continue;
                fuck.G[i][j] = 1;
            }
        }

        fuck.n = node_num;
        int m = node_num;
        int k = fuck.MaxClique();

        cout << m << " " << k << endl;
        for (int i = 0; i < node_num; ++i)
        {
            cout << i;
            for (int j = 0; j < node_num; ++j)
            {
                if (fuck.G[i][j] == 1)
                    cout << " " << j;
            }
            cout << endl;
        }
        if (time != total - 1) cout << endl;
    }
    return 0;
}