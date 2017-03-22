#include <iostream>
using namespace std;
struct node
{
	int data;
	node *next;
};
//把第一个节点当做头结点（头结点不存数据），每个节点的next指向下一个节点
node *newnode()
{
	node *p = new node;
	node *head = p;

	for (int i = 0; i < 5; ++i)
	{
		p -> next = new node;
		p = p -> next;
		cin >> p -> data;
	}

	return head;
}

int main()
{
	node *q = newnode();

	for (int i = 0; i < 5; ++i)
	{
		q = q -> next;
		cout << q -> data;
	}

	cout << endl;

	return 0;
}
