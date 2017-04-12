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

int *sub(int *a, int *b, int row)
{
    int *c = new int[row * row];

    for (int i = 0; i < pow(row,2); ++i)
        c[i] = a[i] - b[i];
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

        int *s1 = new int[each_size];
        int *s2 = new int[each_size];
        int *s3 = new int[each_size];
        int *s4 = new int[each_size];
        int *s5 = new int[each_size];
        int *s6 = new int[each_size];
        int *s7 = new int[each_size];
        int *s8 = new int[each_size];
        int *s9 = new int[each_size];
        int *s0 = new int[each_size];

        s1 = sub(b2,b4,row/2);
        s2 = add(a1,a2,row/2);
        s3 = add(a3,a4,row/2);
        s4 = sub(b3,b1,row/2);
        s5 = add(a1,a4,row/2);
        s6 = add(b1,b4,row/2);
        s7 = sub(a2,a4,row/2);
        s8 = add(b3,b4,row/2);
        s9 = sub(a1,a3,row/2);
        s0 = add(b1,b2,row/2);

        int *p1 = new int[each_size];
        int *p2 = new int[each_size];
        int *p3 = new int[each_size];
        int *p4 = new int[each_size];
        int *p5 = new int[each_size];
        int *p6 = new int[each_size];
        int *p7 = new int[each_size];

        p1 = multi(a1,s1,row/2);
        p2 = multi(s2,b4,row/2);
        p3 = multi(s3,b1,row/2);
        p4 = multi(a4,s4,row/2);
        p5 = multi(s5,s6,row/2);
        p6 = multi(s7,s8,row/2);
        p7 = multi(s9,s0,row/2);
        
        c1 = sub(add(p5,p4,row/2),sub(p2,p6,row/2),row/2);
        c2 = add(p1,p2,row/2);
        c3 = add(p3,p4,row/2);
        c4 = sub(add(p5,p1,row/2),add(p3,p7,row/2),row/2);
        
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