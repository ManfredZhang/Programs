#include <iostream>
using namespace std;

void exchange(int* a, int* b)
{
	int c;
	c = *a;
	*a = *b;
	*b = c; 
}

int main()
{
    int arr[6];
    arr[5] = 222222;//若倒序排列改成-222222
    for (int i = 0; i < 5; i++)
        cin >> arr[i];
    
    for (int i = 1; i < 5; ++i)
    {
    	for (int j = 0; j < 5; ++j)
    	{
    		if (arr[j] > arr[j+1])//若倒序排列改成<
    		{
    			exchange(&arr[j],&arr[j+1]);
    		}
    	}
    }

    for (int i = 0; i < 5; ++i)
    {
    	cout << arr[i] << " ";
    }

    cout << endl;

    return 0;
}

