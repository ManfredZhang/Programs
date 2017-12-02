#include <iostream>
#include <cstdio>
#include <climits>
#include <queue>
#include <algorithm>
using namespace std;
#define N 20

int map[N][N];
int v_num;
int e_num;

queue<int> grey;
int visited[N];
int pre[N];//记录增广路径p
int source = 1;
int terminal = N;
bool bfs(){
    while(!grey.empty()) grey.pop();//先清空queue
    memset(visited, 0, sizeof(visited));
    memset(pre, 0, sizeof(pre));
    visited[source] = 1;
    grey.push(source);
    int a;
    while (!grey.empty()){
        a = grey.front();
        grey.pop();//如果dead end了会通过pop来回溯
        if (a == terminal) return true;
        for (int i = 2; i <= v_num; i++){
            if (!visited[i] && map[a][i]){
            	grey.push(i);
            	visited[i] = 1;
            	pre[i] = a;
            }
        }
    }
    return false;
}

int maxflow(){
	int ans = 0;
    while(bfs()){
	    int a = terminal;
	    int temp = INT_MAX;
	    while(a != source){
	        temp = min(temp, map[pre[a]][a]);
	        a = pre[a];
	    }
	    a = terminal;
	    while(a != source){
	        map[pre[a]][a] -= temp;
	        map[a][pre[a]] += temp;
	        a = pre[a];
	    }
	    ans += temp;
    }
    return ans;
}

int main(){
	int casenum;
	cin >> casenum;
	int count = 1;
	while (casenum--){
		memset(map, 0, sizeof(map));
		cin >> v_num;
		cin >> e_num;
		
		for (int i = 0; i < e_num; ++i){
			int j,k,l;
			cin >> j >> k >> l;
			map[j][k] += l;
		}

		source = 1;
		terminal = v_num;

		printf("Case %d: %d\n", count++, maxflow());
	}
	return 0;
}