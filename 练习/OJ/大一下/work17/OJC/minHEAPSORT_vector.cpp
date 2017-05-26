#include <iostream>
#include <vector>
using namespace std;

int PARENT(int i)
{
    return i / 2;
}

int LEFT_CHILD(int i)
{
    return 2 * i;
}

int RIGHT_CHILD(int i)
{
    return 2 * i + 1;
}

void swap(int &a, int &b)
{
    int temp;
    temp = b;
    b = a;
    a = temp;
}

void MIN_HEAPIFY(vector<int> &a, int n, int heapsize)
{
    int smallest = 0;
    int l = LEFT_CHILD(n);
    int r = RIGHT_CHILD(n);
    if (l <= heapsize && a[l] < a[n])
        smallest = l;
    else
        smallest = n;
    if (r <= heapsize && a[r] < a[smallest])
        smallest = r;
    
    if (smallest != n)
    {
        swap(a[n], a[smallest]);
        MIN_HEAPIFY(a, smallest, heapsize);
    }
}

void BUILD_MIN_HEAP(vector<int> &a, int heapsize)
{
    for (int i = heapsize / 2; i >= 1; i--)
        MIN_HEAPIFY(a, i, heapsize);
}

void HEAPSORT(vector<int> &a, int heapsize)
{
    BUILD_MIN_HEAP(a, heapsize);
    for (int i = heapsize; i >= 1; i--)
    {
        swap(a[heapsize], a[1]);
        heapsize--;
        MIN_HEAPIFY(a, 1, heapsize);
    }
}

int main()
{
    int heapsize;
    while (cin >> heapsize)
    {
        int x;
        vector<int> a;
        a.push_back(0);
        for (int i = 1; i <= heapsize; i++)
        {
            cin >> x;
            a.push_back(x);
        }
        
        HEAPSORT(a, heapsize);
        
        for (int i = 1; i <= heapsize; i++)
        {
            cout << a[i];
            if (i != heapsize)
                cout << " ";
        }
        
        cout << endl;
    }
    
    return 0;
}
