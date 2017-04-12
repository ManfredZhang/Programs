#include <iostream>
using namespace std;

int ab(int a)
{
    if (a > 0)
        return a;
    else
        return -a;
}

void swap(int *a, int *b)
{
    int temp;
    
    temp = *a;
    *a = *b;
    *b = temp;
}

void sort(int *a, int *b, int *c)
{
    if (*a > *b)
        swap(a,b);
    if (*a > *c)
        swap(a,c);
    if (*b > *c)
        swap(b,c);
}


int main()
{
    int a,b,c;
    cin >> a >> b >> c;
    sort(&a, &b, &c);

    string situation;
    cin >> situation;

    int red = 0;
    int blue = 0;
    int yellow = 0;
    int max_now = 0;
    int max = 0;

    int A,B,C;

    for (int i = 0; i < situation.size(); ++i)
    {
        if (situation[i] == 'R')
            red++;
        if (situation[i] == 'B')
            blue++;
        if (situation[i] == 'Y')
            yellow++;

        A = ab(red - blue);
        B = ab(red - yellow);
        C = ab(blue - yellow);
        sort(&A,&B,&C);

        if (red+blue+yellow > max)
            max = red+blue+yellow;

        if (A == a && B == b && C == c)
        {
            red = 0;
            blue = 0;
            yellow = 0;
        }
    }

    if (max == 0)
        cout << situation.size() << endl;
    else
        cout << max << endl;
       
    return 0;
    
}