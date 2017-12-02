#include <iostream>
#include <algorithm>
#include <climits>
using namespace std;

int total = 0;

struct Farm
{
    int key;
    int visited;
};

void Prim(Farm *G, int **Weight, int n)
{
    for (int i = 1; i <= n; i++)
    {
        G[i].key = INT_MAX;
        G[i].visited = 0;
    }
    G[1].key = 0;

    for(int i = 1; i <= n; i++)
    {
        int x, m = INT_MAX;
        for(int i = 1; i <= n; i++)
            if(!G[i].visited && G[i].key <= m)
            {
                x = i;
                m = G[x].key;
            }

        G[x].visited = 1; 
        total += G[x].key;

        for(int i = 1; i <= n; i++) 
            if(!G[i].visited)
                G[i].key = min(G[i].key, Weight[x][i]);
    }
}
int main()
{
    int n; 

    while(cin >> n)
    {
        int **Weight = new int *[n + 1];  
        for (int i = 0; i < n + 1; i++)  
            Weight[i] = new int[n + 1];

        for(int i = 1; i <= n; i++)
            for(int j = 1; j <= n; j++)
                cin >> Weight[i][j];

        total = 0;
        Farm *G = new Farm[n+1];
        Prim(G, Weight, n);
        cout << total << endl;
    }
    return 0;
}