#include <iostream>
#include <vector>
using namespace std;

struct item
{
	string name;
	double num;
};

int main()
{
	vector<item> shopping_list;

	item thing;

	cout << "输入商品名称和数量" << endl;

	while (cin >> thing.name)
	{
		cin >> thing.num;
		shopping_list.push_back(thing);
	}

	cout << endl << "Shopping List: " << endl;
	vector<item>::iterator iter;
	for(iter = shopping_list.begin(); iter != shopping_list.end(); ++iter)
		cout << iter -> num << "*" << iter -> name << endl;

	

	cout << endl;
	return 0;
}