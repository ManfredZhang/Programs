#include <iostream>
#include <cstdio>
using namespace std;
int main() {
	int n = 0;
	while (cin >> n) {
		int *A = new int[n+1];
		int *B = new int[n+1];
		long long output = 0;

		for (int i = 0; i < n+1; ++i) {
			B[i] = -1;
			scanf("%d",&A[i]);
		}

		for (int i = n; i >= 0; i--) {
			if (B[i] == -1) {
                int temp = 0;
                int front = 0;
                while(1) {
                    if((i&(1<<front)) == 0) 
                    	temp += 1<<front;
                    if(temp >= i) break;
                    front++;
                }
                temp -= (1<<front);

                output += (i^temp)+(i^temp);

                B[i] = temp;
                B[temp] = i;
            }
		}
		
		cout << output << endl;
		for (int i = 0; i < n; ++i)
			printf("%d ",B[A[i]]);
		cout << B[A[n]] << endl;
	}
	return 0;
}