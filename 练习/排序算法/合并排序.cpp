#include <iostream>
//#include <ctime>
//#include <cstdlib>
using namespace std;
const int N = 204800;
 
void Merge(int arr[], int p, int q, int r)
{
    int num1 = q - p + 1;//左边的个数
    int num2 = r - q;//右边的个数
    int left[num1 + 1], right[num2 + 1];//建左右数组，都在末位留空位
 
    for (int i = 0; i != num1; ++i)
        left[i] = arr[p + i];//把左边的数放到左数组

    left[num1] = N;//左数组末位等于无穷大
 
    for (int j = 0; j != num2; ++j)
        right[j] = arr[q + j + 1];//把右边的数放到右数组

    right[num2] = N;//右数组末位等于无穷大
 
    int i = 0, j = 0;
    for (int k = p; k != r + 1; ++k)
    {
        if (left[i] > right[j])
        {
            arr[k] = right[j];
            ++j;
        }
        else
        {
            arr[k] = left[i];
            ++i;
        }
    }
}
 
void MergeSort(int arr[], int p, int r)
{
    if(p < r)
    {
        int q = (p + r)/2;
        MergeSort(arr, p, q);
        MergeSort(arr, q + 1, r);
        Merge(arr, p, q, r);
    }
    else return;
}
 
int main()
{
    int arr[10] = {1,0,2,9,3,8,4,7,5,6};
    MergeSort(arr, 0, 9);
    for(int i = 0; i < 10; ++i)
    {
        cout<<arr[i]<<" ";
    }
    cout << endl;
    return 0;
}