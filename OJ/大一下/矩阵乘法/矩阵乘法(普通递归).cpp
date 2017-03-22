#include <iostream>
#include <cmath>
using namespace std;

int *add(int *a, int *b, int row)
{
    int *c = new int[row * row];
    
    for (int i = 0; i < pow(row,2); ++i)
        c[i] = a[i] + b[i];
    
    return c;
}

int *multi(int *a, int *b, int row)
{
    int size = pow(row,2);
    int *c = new int[size];
    
    if (row == 1)
        c[0] = a[0] * b[0];
    else
    {
        int each_size = pow(row/2,2);
        int *c1 = new int[each_size];
        int *c2 = new int[each_size];
        int *c3 = new int[each_size];
        int *c4 = new int[each_size];
        
        int *a1 = new int[each_size];
        int *a2 = new int[each_size];
        int *a3 = new int[each_size];
        int *a4 = new int[each_size];
        
        int *b1 = new int[each_size];
        int *b2 = new int[each_size];
        int *b3 = new int[each_size];
        int *b4 = new int[each_size];
        
        for (int i = 0; i < row/2; ++i)
        {
            for (int j = 0; j < row/2; ++j)
                a1[row/2*i+j] = a[row*i+j];
            for (int j = 0; j < row/2; ++j)
                a2[row/2*i+j] = a[row*i+row/2+j];
        }
        for (int i = 0; i < row/2; ++i)
        {
            for (int j = 0; j < row/2; ++j)
                a3[row/2*i+j] = a[row*row/2 + row*i + j];
            for (int j = 0; j < row/2; ++j)
                a4[row/2*i+j] = a[row*row/2 + row*i + row/2 + j];
        }
        
        for (int i = 0; i < row/2; ++i)
        {
            for (int j = 0; j < row/2; ++j)
                b1[row/2*i+j] = b[row*i+j];
            for (int j = 0; j < row/2; ++j)
                b2[row/2*i+j] = b[row*i+row/2+j];
        }
        for (int i = 0; i < row/2; ++i)
        {
            for (int j = 0; j < row/2; ++j)
                b3[row/2*i+j] = b[row*row/2 + row*i + j];
            for (int j = 0; j < row/2; ++j)
                b4[row/2*i+j] = b[row*row/2 + row*i + row/2 + j];
        }
        
        
        
        c1 = add(multi(a1,b1,row/2), multi(a2,b3,row/2),row/2);
        c2 = add(multi(a1,b2,row/2), multi(a2,b4,row/2),row/2);
        c3 = add(multi(a3,b1,row/2), multi(a4,b3,row/2),row/2);
        c4 = add(multi(a3,b2,row/2), multi(a4,b4,row/2),row/2);
        
        for (int i = 0; i < row/2; ++i)
        {
            for (int j = 0; j < row/2; ++j)
                c[row*i+j] = c1[row/2*i+j];
            for (int j = 0; j < row/2; ++j)
                c[row*i+row/2+j] = c2[row/2*i+j];
        }
        for (int i = 0; i < row/2; ++i)
        {
            for (int j = 0; j < row/2; ++j)
                c[row*row/2 + row*i + j] = c3[row/2*i+j];
            for (int j = 0; j < row/2; ++j)
                c[row*row/2 + row*i + row/2 + j] = c4[row/2*i+j];
        }

    }
    

    return c;
}

int main()
{
    int n;
    cin >> n;
    
    int num = pow(n,2);
    int *matrix1 = new int[num];
    int *matrix2 = new int[num];
    
    for (int i = 0; i < num; ++i)
        cin >> matrix1[i];
    
    for (int i = 0; i < num; ++i)
        cin >> matrix2[i];
    
    int *matrixout = new int[num];
    
    matrixout = multi(matrix1, matrix2, n);
    
    for (int i = 0; i < num; ++i)
    {
        cout << matrixout[i];
        if (i%n != n-1)
            cout << " ";
        else
            cout << endl;
    }
    
    matrixout = multi(matrix2, matrix1, n);
    
    for (int i = 0; i < num; ++i)
    {
        cout << matrixout[i];
        if (i%n != n-1)
            cout << " ";
        else
            cout << endl;
    }
    
    return 0;
}