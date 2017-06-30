#include <iostream>
using namespace std;

long long N = 5000000000;
long long counting = 0;
 
void Merge(int arr[], int p, int q, int r)
{
    int num1 = q - p + 1;
    int num2 = r - q;
    int left[num1 + 1], right[num2 + 1];
 
    for (int i = 0; i != num1; ++i)
        left[i] = arr[p + i];

    left[num1] = N;

    for (int j = 0; j != num2; ++j)
        right[j] = arr[q + j + 1];

    right[num2] = N;
 
    int i = 0, j = 0;
    for(int k = p; k != r + 1; ++k)
    {
        if(left[i] > right[j])
        {
            arr[k] = right[j];
            ++j;
            if (left[i] != N)
                counting += (num1 - i);
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
    if (p < r)
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
    int num;
    while (cin >> num)
    {
    	counting = 0;
	    int *array = new int[num];
	    for (int i = 0; i < num; ++i)
	    {
	        cin >> array[i];
	    }

	    MergeSort(array, 0, num-1);

	   
	    cout << counting << endl;
	}
    return 0;
}