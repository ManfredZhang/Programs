#include <iostream>
using namespace std;

struct node
{
	int data;
	node *next;
};

//把最后一个节点当做头节点，每个节点的next指向上一个节点，最后反向输出
node *newnode()
{
	node *head = NULL;
	for (int i = 0; i < 5; ++i)
	{
		node *p = new node;
		cin >> p -> data;
		p -> next = head;
		head = p;
	}

	return head;
}

int main()
{
//产生一个新节点
	node *p = new node;//新建一个node，node类型的指针p指向新建的node

	cin >> p -> data;
	p -> next = NULL;
	cout << p -> data;

//产生多个节点
	node *q = newnode();
	for (int i = 0; i < 5; ++i)
	{
		cout << q -> data;
		q = q -> next;
	}

	return 0;
}