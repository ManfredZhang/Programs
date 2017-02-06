#include <iostream>
using namespace std;

int main()
{
	int array[100];
	int used = 0;

	int i=0;
    while(cin >> array[i])
    {
        i++;
        used++;
    }

    int unique[100][2];
    int num = 0;

    for (int q = 0; q < used; ++q)
    {
    	if (array[q] != 24601)
    	{
    		unique[num][0] = array[q];
    		num++;

	    	for (int i = 0; i < used; ++i)
		    {
		    	if (array[i] == unique[num-1][0])
		    	{
		    		unique[num-1][1]++;
		    		array[i] = 24601;
		    	}
		    }
		}
    }

    int temp;
	for (int i = 1; i < num; ++i)
	{
		for (int j = 0; j < num - i; ++j)
		{
			if (unique[j][0] < unique[j+1][0])
			{
				temp = unique[j][0];
				unique[j][0] = unique[j+1][0];
				unique[j+1][0] = temp;

				temp = unique[j][1];
				unique[j][1] = unique[j+1][1];
				unique[j+1][1] = temp;
			}
		}
	}

    

    cout << "N    Count" <<endl;
    
    for (int i = 0; i < num; ++i)
    {
    	cout << unique[i][0] << "    " << unique[i][1]<<endl;
    }
    

    return 0;
}