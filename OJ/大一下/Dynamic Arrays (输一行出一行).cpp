#include <iostream>
using namespace std;

void output(string *out, int num)
{
	for (int i = 0; i < num; ++i)
	{
		if (out[i][0] == 'l' && out[i][1] == 'a' && out[i][2] == '#')
			continue;
		else
		{
			if (i != num - 1)
				cout << out[i] << " ";
			else
				cout << out[i];
		}
	}
	cout << endl;
}

int main()
{
	string first[5];
	for (int i = 0; i < 5; ++i)
		cin >> first[i];

	int ex;
	string words;
	int exarr[1000];
	string wordsarr[1000];
	int operation_times = 0;
	while (cin >> ex >> words)
	{
		exarr[operation_times] = ex;
		wordsarr[operation_times] = words;
		operation_times++;

		string *out = new string[operation_times + 10];

		for (int i = 0; i < 5; ++i)
		{
			out[i] = first[i];
		}

		int num_of_words = 5;
		for (int i = 0; i < operation_times; ++i)
		{
			bool flag = true;
			if (exarr[i] == 1)
			{
				out[num_of_words] = wordsarr[i];
				num_of_words++;
				if (i == operation_times - 1)
					output(out,num_of_words);
			}
			else
			{
				for (int j = 0; j < num_of_words + 1; ++j)
				{
					if (j < num_of_words)
					{
						if (out[j] == wordsarr[i])
						{
							out[j] = "la#";
							num_of_words--;
							break;
						}
					}
					else
						flag = false;
				}
				if (i == operation_times - 1 && flag == true)
					output(out,num_of_words+1);
				if (i == operation_times - 1 && flag == false)
					output(out,num_of_words);
				if (flag == true)
				{
					num_of_words++;
				}
				
			}
		}
	}

	return 0;
}