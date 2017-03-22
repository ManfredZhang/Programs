#include <iostream>
using namespace std;

struct node
{
    int data;
    node *next;
};

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
    //新建一个node，准备插在头结点之前
    node *he = new node;
    cin >> he -> data;
    
    //创建五个节点，head指向头结点
    node *head = newnode();
    
    he -> next = head;//he指的节点的next指向第1/5个节点
    head = he;//head指向第1/6个节点（头）
    
    node *ta = new node;
    cin >> ta -> data;
    
    //新建一个node，准备插在尾结点之后
    ta -> next = NULL;
    node *headstay = head;
    
    for (int i = 0; i < 5; ++i)
    {
        head = head -> next;
    }
    head -> next = ta;
    
    //在中间插入
    node *mi = new node;
    cin >> mi -> data;
    head = headstay;
    for (int i = 0; i < 2; ++i)
    {
        head = head -> next;
    }
    mi -> next = head -> next;
    head -> next = mi;
    
    for (int i = 0; i < 8; ++i)
    {
        cout << headstay -> data << " ";
        headstay = headstay -> next;
    }
    
    cout << endl;
    return 0;
}

