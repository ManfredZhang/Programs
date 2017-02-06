#include <iostream>
using namespace std;

struct stu
{
	int id;
	char name; 
};

char search(stu a[], int count, int id)
{
	for (int i = 0; i < count; ++i)
	{
		if (a[i].id == id)
		{
			return a[i].name;
		}
	}
	return '*';
}

int main()
{

	stu array[2] = {{1,'a'},{2,'b'}};

	cout << search(array,2,1) << endl;

	return 0;

}