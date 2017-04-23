#include <iostream>
#include <cstring>
using namespace std;
int main()
{
	int elements;
	while (cin >> elements)
	{
		int table_num;
		cin >> table_num;
		int *table = new int[table_num]();

		double *arrays = new double[elements];

		for (int i = 0; i < elements; i++)
			cin >> arrays[i];

		for (int i = 0; i < elements; i++)
		{
			int a = arrays[i];
			table[a % table_num]++;
		}

		int collision1 = 0;

		for (int i = 0; i < table_num; i++)
		{
			if (table[i] != 0)
				collision1 += table[i] - 1;
		}

		cout << collision1 << endl;


		memset(table, 0, sizeof(int)*table_num);

		for (int i = 0; i < elements; i++)
		{
			arrays[i] *= 0.6180339887;
			int b = arrays[i];
			double c = arrays[i] - b;
			int d = table_num * c;
			table[d]++;
		}

		int collision2 = 0;

		for (int i = 0; i < table_num; i++)
		{
			if (table[i] != 0)
				collision2 += table[i] - 1;
		}

		cout << collision2 << endl;

	}

	

	return 0;
}
