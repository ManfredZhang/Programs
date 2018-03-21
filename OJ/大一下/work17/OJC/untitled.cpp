#include <iostream>
using namespace std;
#define max(x,y) (x>y?x:y)

int main()
{
	int N, M;
	// N days and M courses
	while (cin >> N >> M)
	{
		if (N == M == 0)
			break;
		int **A = new int *[N];  
	    for (int i = 0; i < N; i++)  
	        A[i] = new int[M]; 
	    for (int i = 0; i < N; ++i)
	    	for (int j = 0; j < M; ++j)
	    		cin >> A[i][j];


	    int k = M;
	    int v = N;
	    int F[10000] = {0};
	    for (int k = 1; k <= N; ++k) // k 组背包，每一天是一个组
	    	for (int v = M; v >= 1; --v) // 考虑 M 门课程能取得的最大值
	    		for (int i = 1; i <= M; ++i) // 在第 k 组里把每门课挨个试
	    			F[v] = max(F[v],F[v-i]+A[i][k]);
	    cout << F[M] << endl;
	}
	return 0;
}