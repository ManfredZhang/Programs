#include <iostream>
#include <algorithm>
using namespace std;

struct item_struct {
    int brand;
    int value;
    int weight;
} item[105];

int main() {
    int product_num, have_money, brand_num;
    while (cin >> product_num >> have_money >> brand_num) {
        for (int i = 0; i < product_num; i++)
            cin >> item[i].brand >> item[i].value >> item[i].weight;

        int f[105][10025];
        for (int i = 0; i <= brand_num; i++) {
            for(int j = 0; j <= have_money; j++) {
                if (i == 0) f[i][j] = 0;
                else f[i][j] = -1;
            }
        }

        for (int i = 1; i <= brand_num; i++) {
            for (int j = 0; j < product_num; j++) {
                if (item[j].brand == i) {
                    for (int k = have_money; k >= item[j].value; k--)
                        f[i][k] = max(max(f[i][k],f[i][k-item[j].value]+item[j].weight),f[i-1][k-item[j].value]+item[j].weight);
                }
            }
        }

        if (f[brand_num][have_money] < 0)
            printf("Impossible\n");
        else
            printf("%d\n",f[brand_num][have_money]);
    }
    return 0;
}