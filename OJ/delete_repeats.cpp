#include <iostream>
using namespace std;

int main()
{
	char array[130];
	int used = 0;
    int i=0;
	while(cin >> array[i])
    {
        i++;
        used++;
    }

    for (int i = 0; i < used; ++i)
    {
        for (int j = i + 1; j < used; ++j)
        {
            if(array[i] == array[j])
                array[j] = '0'; 
        }
    }

    for (int i = 0; i < used; ++i)
    {
    	if (array[i] != '0')
        	cout << array[i];
    }
    
    cout << endl;
    

	return 0;
}