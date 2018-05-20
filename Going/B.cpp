#include <iostream>
#include <climits>
#include <cmath>
#include <algorithm>
using namespace std;

#define eps 1e-7

int n,k;

int judge(double x, int* a, int* b) {
    double *y = new double[n];
    for (int i = 0; i < n; i++) {
        y[i] = a[i]-x*b[i];
    }
    sort(y,y+n);
    double sum = 0;
    for(int i = k; i < n; i++)
        sum += y[i];
    return sum>=0.0;
}

int main() {
	while (cin >> n >> k) {
		if (n == 0 && k == 0) break;
		int *benefit = new int[n];
		int *cost = new int[n];
		for (int i = 0; i < n; ++i) cin >> benefit[i];
		for (int i = 0; i < n; ++i) cin >> cost[i];

		double l = 0;
		double r = INT_MAX;

		while(fabs(r-l)>eps)
        {
            double mid = (l+r)/2;
            if(judge(mid,benefit,cost) == 1)
				l = mid;
            else r = mid;
        }
        int result = (int)(l*100+0.5);
        cout << result << endl;

	}
	return 0;
}
