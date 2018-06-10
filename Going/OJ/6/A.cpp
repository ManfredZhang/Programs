#include <iostream>
#include <cstdio>
#include <ctime>
#include <cstdlib>
using namespace std;

int order;
int A[505][505];
int B[505][505];
int C[505][505];

int main() {
	srand((unsigned)time(0));


    scanf("%d",&order);
    for(int i = 0; i < order; ++i) {
        for(int j = 0; j < order; ++j)
            scanf("%d",&A[i][j]);
    }
    for(int i = 0; i < order; ++i) {
        for(int j = 0; j < order; ++j)
            scanf("%d",&B[i][j]);
    }
    for(int i = 0; i < order; ++i) {
        for(int j = 0; j < order; ++j)
            scanf("%d",&C[i][j]);
    }
    

    int equal = 1;
    int checktime = 50000;
    while (checktime--) {
        int x = rand()%order;
        int y = rand()%order;
        int sum = 0;
        for(int i = 0; i < order; ++i)
            sum+=A[x][i]*B[i][y];

        if(sum != C[x][y]) {
            equal = 0;
            break;
        }
    }

    if (equal) 
    	printf("YES\n");
    else 
    	printf("NO\n");
    return 0;
}
