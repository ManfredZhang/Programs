#include <iostream>
#include <cstdio>
#include <cstdlib>
#include <cstring>
#include <algorithm>
using namespace std;

struct edge_struct {
    int u;
    int v;
    int name;
} edges[55];
int num_of_v, num_of_e;
int union_v[25];
int size_of_union_v[25];

void makeSet(int size) {
    for (int i = 0; i < size; i++) 
    	union_v[i] = i;
}

int find(int x) {
    if (x != union_v[x])
        union_v[x] = find(union_v[x]);
    return union_v[x];
}

int unionSet(int x, int y) {
    if ((x = find(x)) == (y = find(y))) return 0;
    if (size_of_union_v[x] > size_of_union_v[y])
        union_v[y] = x;
    else {
        union_v[x] = y;
        if (size_of_union_v[x] == size_of_union_v[y])
            size_of_union_v[y]++;
    }
    return 1;
}

int main() {
    int test_num; cin >> test_num;
    while (test_num--) {
    	// cin
        cin >> num_of_v >> num_of_e;
	    memset(edges, 0, sizeof(edges));
	    memset(size_of_union_v, 0, sizeof(size_of_union_v));

	    for (int i = 0; i < num_of_e; i++) {
	        scanf("%d:%d", &edges[i].u, &edges[i].v);
	        edges[i].u--;
	        edges[i].v--;
	        edges[i].name = i;
	    }

	    // algorithm
        makeSet(num_of_v);
	    int num_left_v = num_of_v;
	    int num_left_e = num_of_e;
	    int turn = 1;
	    int origin_index;

	    while (num_left_v > 2) {
	    	// find a random edge 
	        int random = (turn * 32761) % num_left_e;
	        for (int i = 0; i < num_of_e; i++)
	            if (edges[i].name == random) 
	                origin_index = i;
	        int u = edges[origin_index].u;
	        int v = edges[origin_index].v;

	        // contract the random edge just union because no self loop
	        unionSet(u, v);
	        num_left_v--;

	        // delete the random edge and the self circles caused by the contraction
	        edges[origin_index].name = -1;
	        for (int i = 0; i < num_of_e; i++) {
	            if (edges[i].name >= 0) {
	                if (find(edges[i].u) == find(edges[i].v)) {
	                    edges[i].name = -1;
	                }
	            }
	        }

	        // num the left edges 
	        num_left_e = 0;
	        for (int i = 0; i < num_of_e; i++) {
	            if (edges[i].name >= 0) {
	                edges[i].name = num_left_e++;
	            }
	        }

	        turn++;
	    }

	    // cout
	    int final_count = 0;
	    for (int i = 0; i < num_of_e; i++) {
	        if (edges[i].name >= 0) {
	            final_count++;
	            printf("%d:%d", min(edges[i].u, edges[i].v)+1, max(edges[i].u, edges[i].v)+1);
	            if (final_count == num_left_e) cout << endl;
	            else cout << " ";
	        }
	    }
    }
    return 0;
}