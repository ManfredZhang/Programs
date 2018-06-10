#include <iostream>
#include <cstdio>
#include <ctime>
#include <cstdlib>
#include <cmath>
using namespace std;

const int MAX=2e5;
double x[MAX];
double y[MAX];
double qx,qy;

double dis(int a,int b)
{
    return sqrt((x[a]-x[b])*(x[a]-x[b])+(y[a]-y[b])*(y[a]-y[b]));
}
void get_centre(int a, int b, int c) //三点共圆圆心公式
{
    qx = ((x[a]*x[a]-x[b]*x[b]+y[a]*y[a]-y[b]*y[b]) * (y[a]-y[c])
        - (x[a]*x[a]-x[c]*x[c]+y[a]*y[a]-y[c]*y[c])*(y[a]-y[b])) 
        / (2*(y[a]-y[c])*(x[a]-x[b])-2*(y[a]-y[b])*(x[a]-x[c])
        );
    qy = ((x[a]*x[a]-x[b]*x[b]+y[a]*y[a]-y[b]*y[b])*(x[a]-x[c])
        - (x[a]*x[a]-x[c]*x[c]+y[a]*y[a]-y[c]*y[c])*(x[a]-x[b]) ) 
        / (2*(y[a]-y[b])*(x[a]-x[c])-2*(y[a]-y[c])*(x[a]-x[b])
        );
}


int main() {
    srand((unsigned)time(0));

    int testcase;
    cin >> testcase;
    while (testcase--) {
        int point;
        scanf("%d",&point);
        for (int i = 0; i < point; i++)
            scanf("%lf%lf",&x[i],&y[i]);

        if (point==1 || point==2) {
            printf("%lf %lf %lf\n",x[0]+1,y[0],1.0);
            continue;
        }
        if (point==3 || point==4) {
            printf("%lf %lf %lf\n",(x[1]+x[2])/2,(y[1]+y[2])/2,dis(1,2)/2);
            continue;
        }
        while(1) {
            int a = rand() % point;
            int b = rand() % point;
            int c = rand() % point;
            if (a==b || a==c || b==c) continue;
            if (fabs((y[b]-y[a])*(x[c]-x[b])-(y[c]-y[b])*(x[b]-x[a]))<=1e-6) continue;
            get_centre(a,b,c);
            int sum = 0;
            x[point] = qx;
            y[point] = qy;
            int q = point;
            for (int i = 0; i < point; i++) {
                if (abs(dis(i,q)-dis(a,q))<=1e-6) sum++;
            }
            // if (2*sum >= point) {
            //     cout << qx << " " << qy << " " << dis(a,q) << endl;
            //     break;
            // }
            if(2*sum>=point){printf("%lf %lf %lf\n",qx,qy,dis(a,q));break;}  
        }
    }
    return 0;
}
