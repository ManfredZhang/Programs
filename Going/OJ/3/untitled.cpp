#include <iostream>
#include <cstdio>
#include <climits>

using namespace std;

int line[1000][1000],used[1000];
int girl[1000];

bool find(int x, int m) {
    for (int i = 1; i <= m; i++) {
        if (line[x][i] == true && used[i] == false) {
            used[i] = 1;
            if (girl[i] == 0 || find(girl[i],m)) {
                girl[i] = x;
                return true;
            }
        }
    }
    return false;
}

int main()
{
    int k,i,x,y,n,m;
    while (cin >> n) {
        if (n == 0) break;
        memset(line,0,sizeof(line));
        memset(girl,0,sizeof(girl));
        

        cin >> m >> k;
        for (int i = 0; i < k; i++) {
            cin >> i >> x >> y;
            line[x][y]=1;
        }

        int all = 0;
        for (int j = 1; j <= n; j++)
        {
            memset(used,0,sizeof(used));
            if (find(j,m))
                all++;
        }
        cout << all << endl;
    }
    return 0;
}