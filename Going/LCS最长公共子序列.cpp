#include <iostream>
#include <vector>
using namespace std;

/*
Record
1 ↖
2 ←
3 ↑
 */

vector<int**> LCS_LENGTH(vector<int> A, vector<int> B)
{
	vector<int**> C;

	int **Length = new int *[B.size() + 1];  
    for(int i = 0; i < B.size() + 1; i++)  
        Length[i] = new int[A.size() + 1]; 

    int **Record = new int *[B.size() + 1];  
    for(int i = 0; i < B.size() + 1; i++)  
        Record[i] = new int[A.size() + 1]; 

    int column = A.size() + 1;
    int row = B.size() + 1;

    for (int i = 0; i < column; ++i)
    	Length[0][i] = 0;
    for (int i = 0; i < row; ++i)
    	Length[i][0] = 0;
    for (int i = 0; i < row; ++i)
    {
    	for (int j = 0; j < column; ++j)
    		Record[i][j] = 0;
    }

    for (int i = 1; i < row; ++i)
    {
    	for (int j = 1; j < column; ++j)
    	{
    		if (B[i - 1] == A[j - 1])
    		{
    			Length[i][j] = Length[i - 1][j - 1] + 1;
    			Record[i][j] = 1;
    		}
    		else if (Length[i - 1][j] >= Length[i][j - 1])
    		{
    			Length[i][j] = Length[i - 1][j];
    			Record[i][j] = 3;
    		}
    		else
    		{
    			Length[i][j] = Length[i][j - 1];
    			Record[i][j] = 2;
    		}
    	}
    }

    C.push_back(Length);
    C.push_back(Record);

	return C; 
}

int main()
{
	vector<int> A;
	A.push_back(2);
	A.push_back(4);
	A.push_back(3);
	A.push_back(1);
	A.push_back(2);
	A.push_back(1);

	vector<int> B;
	B.push_back(1);
	B.push_back(2);
	B.push_back(3);
	B.push_back(2);
	B.push_back(4);
	B.push_back(1);
	B.push_back(2);

	vector<int**> C;
	C = LCS_LENGTH(A, B);

	/*for (int i = 0; i <= B.size(); ++i)
	{
		for (int j = 0; j <= A.size(); ++j)
		{
			cout << C[1][i][j] << " ";
		}
		cout << endl;
	}*/
	
	/*
	打印出Length：
	0 0 0 0 0 0 0 
	0 0 0 0 1 1 1 
	0 1 1 1 1 2 2 
	0 1 1 2 2 2 2 
	0 1 1 2 2 3 3 
	0 1 2 2 2 3 3 
	0 1 2 2 3 3 4 
	0 1 2 2 3 4 4 
	打印出Record：
	0 0 0 0 0 0 0 
	0 3 3 3 1 2 1 
	0 1 2 2 3 1 2 
	0 3 3 1 2 3 3 
	0 1 3 3 3 1 2 
	0 3 1 3 3 3 3 
	0 3 3 3 1 3 1 
	0 1 3 3 3 1 3 
	*/

	//输出右下角的4
	cout << C[0][B.size()][A.size()] << endl;

	//输出最小序列
	int i = B.size();
	int j = A.size();
	int **R = C[1];
	
	while (i != 0 && j != 0)
	{
		if (R[i][j] == 1)
		{
			cout << B[i - 1] << " ";
			i--;
			j--;
		}
		if (R[i][j] == 2)
		{
			j--;
			//cout << C[0][i][j] << " ";
		}
		else
		{
			i--;
			//cout << C[0][i][j] << " ";
		}
	}
	cout << endl;

	return 0;
}