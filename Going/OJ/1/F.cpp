#include <iostream>
using namespace std;
#define max(x,y) (x>y?x:y)

int main()
{
	int N, M;
	// N days and M courses
	while (cin >> N >> M)
	{
		if (N == 0 && M == 0)
			break;
		int **A = new int *[N];  
	    for (int i = 0; i < N+1; i++)  
	        A[i] = new int[M+1]; 

	    for (int i = 0; i <= N; ++i)
	    {
	    	for (int j = 0; j <= M; ++j)
	    	{
	    		A[i][j] = 0;
	    	}
	    }
	    for (int i = 1; i <= N; ++i)
	    	for (int j = 1; j <= M; ++j)
	    		cin >> A[i][j];

	    int F[10000];
		for (int i = 0; i < 10000; ++i)
		{
			F[i] = 0;
		}
	    for (int k = 1; k <= N; ++k) // k 组背包，每一天是一个组
	    	for (int v = M; v >= 1; --v) // 考虑 M 门课程能取得的最大值
	    		for (int i = 1; i <= v; ++i) // 在第 k 组里把每门课挨个试
	    			F[v] = max(F[v],F[v-i]+A[k][i]);
	    cout << F[M] << endl;
	}
	return 0;
}
