#include <iostream>
using namespace std;
#define N 120

int get_prime(int No)
{
	int *num = new int[N];
     memset(num, 0, sizeof(int));

     for (int i = 2; i < N; i++)
     {
         if (num[i] == 0)
         {
             int temp = i;
             int times = 2;
             while (temp*times < N)
             {
                 num[temp*times] = 1;
                 times++;
             }
         }
     }

     for (int i = 1; i < N; i++)
     {
         if (num[i] == 0)
		 {
			 if (No == 0)
				return i;
			 No--;
		 }
     }
	 return 5555555;
}

int main()
{
	//120 = 2*2*2*3*5
	int nn = N;
	int multiprime[20];
	int temp = 1;
	while (nn != 1)
	{
		if (nn % get_prime(temp) == 0)
		{
			multiprime[temp-1] = get_prime(temp);
			nn /= get_prime(temp);
			//cout << get_prime(temp) << endl;
		}
		else
			temp++;
	}

	int *num = new int[N];
	memset(num, 0, sizeof(int));

	for (int i = 0; i < temp; i++)
    {
             int tempp = multiprime[i];
             int times = 2;
             while (tempp*times < N)
             {
                 num[tempp*times] = 1;
                 times++;
             }
    }

	for (int i = 1; i < N; i++)
	{
		if (num[i] == 0)
			cout << i << endl;
	}

			

	return 0;
}
