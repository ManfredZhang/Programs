#include <iostream>
#include <cstdio>
#include <cmath>
#define PI 3.1415926
using namespace std;

int main() {
	double s,h,r,v;
	while (cin >> s) {
		r = sqrt(s/PI)/2.0;
		h = sqrt((s*s)/(PI*PI*r*r) - 2.0*s/PI);
		v = PI*r*r*h/3.0;
		printf("%.2lf\n%.2lf\n%.2lf\n",v,h,r);
	}
	return 0;
}
