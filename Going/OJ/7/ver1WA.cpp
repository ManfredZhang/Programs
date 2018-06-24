#include <iostream>
#include <cstdio>
#include <cstring>
using namespace std;

#define MAX 10000

int group_num;
int vertex_num, edge_num;
int same_vertex[25][25]; // if v[i] and v[j] is constracted to one then same[i][j] == same[j][i] == 1

struct edvs {
	int num;
	int small_one;
	int big_one;
} edv[55];

void see() {
	cout << "\nedv\n";
	for (int i = 0; i < edge_num; ++i)
		cout << edv[i].num << ": " << edv[i].small_one << " " << edv[i].big_one << endl;
	cout << endl;
}


int main() {
	cin >> group_num;
	while (group_num--) {
		// init
		for (int i = 0; i < 55; ++i) {
			edv[i].num = i;
			edv[i].small_one = 0;
			edv[i].big_one = 0;
		}
		memset(same_vertex, 0, sizeof(same_vertex));
		for (int i = 0; i < 25; ++i)
			same_vertex[i][i] = 1;

		// cin
		cin >> vertex_num >> edge_num;
		for (int i = 0; i < edge_num; ++i) {
			int v1,v2;
			scanf("%d:%d", &v1,&v2);
			edv[i].small_one = (v1<v2)?(v1):(v2);
			edv[i].big_one = (v1>v2)?(v1):(v2);
		}
		
		//see();

		// compute
		int left_vertex_num = vertex_num;
		int left_edge_num = edge_num;
		int turn = 1;
		while (left_vertex_num > 2) {
			int edge_delete[55];
			memset(edge_delete, 0, sizeof(edge_delete));
			int edge_delete_count = 0;
			// delete a random edge[ii]
			long long random = (32761 * turn) % left_edge_num;
			//cout << "choose " << random << endl;
			int ii = 0;
			while (edv[ii].num != random) ii++;
			edv[ii].num = MAX;
			edge_delete[edge_delete_count] = ii;
			edge_delete_count++;

			//see();
			//cout << "find nothing?\n"; 
			// delete relevant edges
			for (int i = 1; i <= vertex_num; ++i) {
				if (same_vertex[edv[ii].small_one][i]) {
					// vertex[i] == vertex[small_one]
					for (int j = 0; j < edge_num; ++j) {
						if (edv[j].num != MAX && edv[j].small_one == i) {
							// now we find all the left edges with small_one the same
							for (int k = 1; k <= vertex_num; ++k) {
								if (same_vertex[edv[ii].big_one][k]) {
									// vertex[k] == vertex[big_one]
									for (int l = 0; l < edge_num; ++l) {
										if (edv[l].num != MAX && l == j && edv[l].big_one == k) {
											// now we find all the relevant edges
											// cout << "find l: " << edv[l].num << endl;
											edv[l].num = MAX;
											edge_delete[edge_delete_count] = l;
											edge_delete_count++;
										}
									}
								}
							}
						}
					}
				}
			}
			for (int i = 1; i <= vertex_num; ++i) {
				if (same_vertex[edv[ii].small_one][i]) {
					// vertex[i] == vertex[small_one]
					for (int j = 0; j < edge_num; ++j) {
						if (edv[j].num != MAX && edv[j].big_one == i) {
							// now we find all the left edges with small_one the same
							for (int k = 1; k <= vertex_num; ++k) {
								if (same_vertex[edv[ii].big_one][k]) {
									// vertex[k] == vertex[big_one]
									for (int l = 0; l < edge_num; ++l) {
										if (edv[l].num != MAX && l == j && edv[l].small_one == k) {
											// now we find all the relevant edges
											// cout << "find l: " << edv[l].num << endl;
											edv[l].num = MAX;
											edge_delete[edge_delete_count] = l;
											edge_delete_count++;
										}
									}
								}
							}
						}
					}
				}
			}

			// delete self circle
			for (int i = 0; i < edge_num; ++i) {
				if (edv[i].num != MAX) {
					if (same_vertex[edv[i].small_one][edv[i].big_one] == 1) {
						edv[i].num = MAX;
						edge_delete_count++;
					}
				}
			}
	

			//see();
			
			left_edge_num = left_edge_num - edge_delete_count;
			int new_count = 0;
			for (int i = 0; i < edge_num; i++) {
				if (edv[i].num != MAX) {
					edv[i].num = new_count;
					new_count++;
				}
			}

			//see();

			int v1 = edv[ii].small_one;
			int v2 = edv[ii].big_one;

			turn++;
			if (same_vertex[v1][v2] == 1) continue;
				
			same_vertex[v1][v2] = 1;
			same_vertex[v2][v1] = 1;
			left_vertex_num--;
		}

		int finalcount = 0;
		for (int i = 0; i < edge_num; ++i) {
			if (edv[i].num != MAX) {
				//if (edv[i].small_one < edv[i].big_one)
					cout << edv[i].small_one << ":" << edv[i].big_one;
				finalcount++;
				if (finalcount < left_edge_num)
					cout << " ";
			}
		}
		cout << endl;

	}
	return 0;
}
