#include <iostream>
#include <cstdio>
#include <cmath>
using namespace std;

int n;
double cur_x,cur_y,result,t;

struct coor {
	double x,y;
}p[105];

double get_dis(double x,double y,coor p) {
	return sqrt(pow(x-p.x,2)+pow(y-p.y,2));
}

double get_sum(double x,double y) {
    double sum = 0;
    for(int i = 1; i <= n; i++)
        sum += get_dis(x,y,p[i]);
    return sum;
}

int main() {
    while(cin >> n) {
        cur_x = 0;
		cur_y = 0;
		result = 0;
		t = 100;
        for(int i = 1; i <= n; i++) {
            cin >> p[i].x >> p[i].y;
            cur_x += p[i].x;
			cur_y += p[i].y;
        }

		// 先得到一个可行解并计算出结果
        cur_x /= n; cur_y /= n;
        result = get_sum(cur_x,cur_y);

		// 开始爬山
        double tmp,x,y;
        while(t > 0.1) {
			// 加入偏移后再计算结果
            x = 0;
			y = 0;
            for(int i=1; i<=n; i++) {
                x += (p[i].x-cur_x)/get_dis(cur_x,cur_y,p[i]);
                y += (p[i].y-cur_y)/get_dis(cur_x,cur_y,p[i]);
            }
            tmp = get_sum(cur_x+x*t,cur_y+y*t);
			
			// 若结果更优则保存到当前最优解
            if(tmp < result) {
				result = tmp;
				cur_x += x*t;
				cur_y += y*t;
			}
            t *= 0.5;
        }
        printf("%.0lf\n",result);
    }
    return 0;
}
