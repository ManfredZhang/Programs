#include <iostream>
#include <algorithm>
using namespace std;

bool cmp(const int &a, const int &b) {
    return a > b;
}

int main() {
	int cases = 0;
	cin >> cases;
	for (int c = 0; c < cases; c++) {
		int n = 0; cin >> n;
		int l = 0; cin >> l;
		int *item = new int[n];
		for (int i = 0; i < n; ++i) {
			cin >> item[i];
		}

		int count = 0;
		int head = 0;
		int tail = n-1;

		sort(item, item + n, cmp);

		while (head <= tail) {
			if (item[head] + item[tail] <= l) {
				count++;
				head++; tail--;
			}
			else {
				count++;
				head++;
			}
		}

		cout << count << endl;
		if (c != cases - 1)
			cout << endl;

	}
	return 0;
}