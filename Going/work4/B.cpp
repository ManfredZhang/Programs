#include <iostream>
#include <stdio.h>
using namespace std;

int used[100000];
int Rank[100000];
struct Range_Struct {
	int bot;
	int top;
}Range[65];

bool FIND(int x) {
	int i,j;
	for (j = Range[x].bot; j <= Range[x].top; j++) {
		if (used[j] == 0) {
			used[j] = 1;
			if (Rank[j] == 0 || find(Rank[j])) { 
				Rank[j]=x;
				return true;
			}
		}
	}
	return false;
}

int main() {
	int case_num = 0;
	int stu_num = 0;
	cin >> case_num;
	while (case_num--) {
		cin >> stu_num;
		for (int i = 0; i < stu_num; i++) {
			scanf("%d%d", &Range[i].bot, &Range[i].top);			
		}
	}
	return 0;
}
