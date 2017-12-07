#include <stdio.h>
int main()
{
	
	char *c = {"NBQFRSMXZFYAWJUFHWFFESKGQCFWDQAFNBQFTILOFCWP"};
	for (int i = 0; i < 26; i++)
	{
		for (int j = 0; j < 44; j++)
		{
			//c[j] = (char)(((int)c[j])+1);
			int temp = ((int)c[j] - (int)'a' + 1) % 26;
			c[j] = (char) (temp + (int)'a');
		}
		printf("%s\n", c);
	}
	//printf("%d\n", c[

	return 0;
}
