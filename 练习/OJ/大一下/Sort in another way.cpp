#include <iostream>
#include <vector>
using namespace std;
int main()
{
    vector<int> array;
    int a;
    array.push_back(-1);
    while (cin >> a)
        array.push_back(a);
    
    int *box = new int[array.size()+2];
    
    box[0] = 2;
    box[array.size()+1] = 0;
    
    for (int i = 1; i < array.size()+1; i++)
    {
        box[i] = 0;
    }
    
    for (int i = 1; i < array.size(); i++)
    {
        box[array[i]] = 1;
        if (box[array[i]-1] == 2)
        {
            int j = array[i];
            while (box[j] == 1)
            {
                cout << j;
                if (box[j+1] != 0)
                    cout << ",";
                j++;
            }
            for (int p = array[i]; p < j; p++)
                box[p] = 2;
            cout << endl;
        }
    }
    
    return 0;
}