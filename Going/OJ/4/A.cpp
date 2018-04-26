#include <iostream>
#include <cstdlib>
#include <climits>
#include <string>
#include <queue>

using namespace std;

int left_num[10];
int num_of_left;
bool visited[800000];


string bfs(int n) {
        struct node {
        int mod;
        string s;
    };
    queue<node> q;

    node visiting_node;
    visiting_node.mod = 0;
    visiting_node.s = "";

    q.push(visiting_node);
    while (!q.empty()){
        visiting_node = q.front();
        q.pop();

        node e;
        for (int i = 0; i < num_of_left; i++) {
            e = visiting_node;
            int temp = visiting_node.mod*10 + left_num[i];

            if (temp == 0) continue;

            e.mod = temp%n;
            e.s += (left_num[i]+'0');
            temp %= n;

            if (!visited[temp]) { 
            // 判断 x mod n 是否已经存在
            // 因为是从小到大搜索的
            // 如果存在的话，说明有比当前结果更优的解，剪枝
                visited[temp] = 1;
                if (temp == 0) {
                    // cout << e.s << endl;
                    return e.s;
                }
                q.push(e);
            }
        }
    }
    string tt = "-1";
    // cout << -1 << endl;
    return tt;
}

int main() {
    int n,m,x;
    int case_count = 1;
    while (cin >> n >> m) {
        int never_num[10];
        memset(never_num, 0, sizeof(never_num));
        memset(visited, 0, sizeof(visited));
        for (int i = 0; i < m; i++) {
            cin >> x;
            never_num[x] = 1;
        }

        num_of_left = 0;
        for(int i = 0; i < 10; i++)
            if(!never_num[i]) 
                left_num[num_of_left++] = i;

        cout << "Case " << case_count++ << ": " << bfs(n) << endl;
    }
    return 0;
}