#include <iostream>
#include <algorithm> 
using namespace std;

struct item_struct {
	int value;
	int weight;
} item[505];

int main() {
	int test_case_num = 0;
	cin >> test_case_num;
 
 	while (test_case_num--) {
		int item_num = 0; cin >> item_num;
		int bag_size = 0; cin >> bag_size;
		int sum_value = 0;
		for (int i = 1; i <= item_num; ++i) {
			cin >> item[i].weight;
			cin >> item[i].value;
			sum_value += item[i].value;
		}

		long long f[5005];
		// f[i] denotes the min weight that sum value i can achieve
		memset(f, 0x55, sizeof(f));
		f[0] = 0;
		for (int i = 1; i <= item_num; i++) {
			for (int j = sum_value; j >= item[i].value; j--)
				f[j] = min(f[j], f[j-item[i].value] + item[i].weight);
		}
		for (int i = sum_value; i >= 0; i--) {
			if (f[i] <= bag_size) {
				printf("%d\n",i);
				break;
			}
		}
	}
	
	return 0;
}