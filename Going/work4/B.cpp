#include <iostream>
#include <cstdio>
#include <algorithm>
using namespace std;

int Rank_settled[100000];
int Rank_occupying[100000];
int Truth_tolder[65];

struct Range_Struct {
	int bot;
	int top;
}Range[65];

bool FIND(int x) {
	int i,j;
	for (j = Range[x].bot; j <= Range[x].top; j++) {
		if (Rank_settled[j] == 0) {
			Rank_settled[j] = 1;
			if (Rank_occupying[j] == 0 || FIND(Rank_occupying[j])) { 
				Rank_occupying[j] = x;
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
		memset(Rank_occupying,0,sizeof(Rank_occupying));
		cin >> stu_num;
		for (int i = 1; i <= stu_num; i++) {
			scanf("%d%d", &Range[i].bot, &Range[i].top);	
			//cout << "0\n";		
		}
		//cout << "1\n";
		int truth_num = 0;
		for (int i = stu_num; i >= 1; i--) {
			memset(Rank_settled,0,sizeof(Rank_settled));
			//cout << "2\n";
			if (FIND(i))
				truth_num++;
		}
		cout << truth_num << endl;

		int counter = 0;
		for (int i = 0; i <= 100000; i++) {
			if (Rank_occupying[i] != 0) {
				Truth_tolder[counter++] = Rank_occupying[i];
			}
		}
		sort(Truth_tolder, Truth_tolder + truth_num);

		for (int i = 0; i < truth_num - 1; i++) {
			printf("%d ", Truth_tolder[i]);
		}
		printf("%d\n", Truth_tolder[truth_num - 1]);


	}
	return 0;
}
