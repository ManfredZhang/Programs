#include <iostream>
using namespace std;

int main()
{
	int i = 0,ia;
	double a[66];
	while(i<64)
    {
        cin >> a[i++];
        if ( a[i-1] == -1 )
            break;
    }
    ia = i - 1;

    int num;
    cin >> num;

    double relation[4096][2];


    for (int i = 0; i < num; ++i)
    {
    	for (int j = 0; j < 2; ++j)
    	{
    		cin >> relation[i][j];
    	}
    }

    //自反判断
    int reflexive = 0;
    for (int i = 0; i < num; ++i)
    {
	   	if (relation[i][0]==relation[i][1])
	    {
	    	reflexive++;
	    }
	}
	if (reflexive == ia)
		cout << "reflexive"<< endl;
	

	//对称判断
	double temp1,temp2;
	bool symmetric;
	for (int i = 0; i < num; ++i)
	{
		temp1 = relation[i][0];
		temp2 = relation[i][1];

		for (int p = 0; p <num ; ++p)
		{
			if (relation[p][0] == temp2 && relation[p][1] == temp1)
			{
				symmetric = true;
				break;
			}
			else
				symmetric = false;
		}

		if (symmetric == false)
			break;
	}
	if (symmetric == true)
		
		cout << "symmetric" << endl;

	//传递判断
	double temp3;
	bool transitive;
	for (int i = 0; i < num; ++i)
	{
		temp1 = relation[i][0];
		temp2 = relation[i][1];

		for (int p = 0; p <num ; ++p)
		{
			if (relation[p][0] == temp2)
			{
				temp3 = relation[p][1];
				for (int q = 0; q < num; ++q)
				{
					if (relation[q][0] == temp1 && relation[q][1] == temp3)
					{
						transitive = true;
						break;
					}
					else
						transitive = false;
				}

				if (transitive == true)
					break;
			}
		}
		if (transitive == false)
			break;
	}
	if (transitive == true)
		
		cout << "transitive" << endl;

	return 0;
}
