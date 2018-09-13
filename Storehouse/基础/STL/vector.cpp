#include <iostream>
#include <vector>
#include <algorithm>
using namespace std;

bool comp(int &a, int &b)
{
    return b<a;
}

int main()
{
//初始化
    int u = -1;
    vector<int> a;
    a.push_back(u);
//push_back
    for (int i = 0; i < 5; i++)
        a.push_back(i);
//iterator
    vector<int>::iterator go;
    for (go = a.begin(); go != a.end(); go++)
        cout << *go << " ";
    cout << endl;
//insert
    a.insert(a.begin()+1,50);
    for (go = a.begin(); go != a.end(); go++)
        cout << *go << " ";
    cout << endl;
    
//reverse（使反序）
    reverse(a.begin(),a.end());
    for (go = a.begin(); go != a.end(); go++)
        cout << *go << " ";
    cout << endl;

//sort（顺序倒序）
    sort(a.begin(),a.end());
    for (go = a.begin(); go != a.end(); go++)
        cout << *go << " ";
    cout << endl;
    
    sort(a.begin(),a.end(),comp);
    for (go = a.begin(); go != a.end(); go++)
        cout << *go << " ";
    cout << endl;
    
//resize
    a.resize(3);
    for (go = a.begin(); go != a.end(); go++)
        cout << *go << " ";
    cout << endl;
    
    a.resize(5,6);
    for (go = a.begin(); go != a.end(); go++)
        cout << *go << " ";
    cout << endl;
    
//reserve
    cout << "initilize capacity: " << a.capacity() << endl;
    a.reserve(30);
    cout << "and now: " << a.capacity() << endl;
    //reserve只改变容纳能力不能改变实际size（不能变小）
    
    

//erase
    a.erase(a.begin()+2);
    for (go = a.begin(); go != a.end(); go++)
        cout << *go << " ";
    cout << endl;

    a.erase(a.begin()+1, a.end()-1);
    for (go = a.begin(); go != a.end(); go++)
        cout << *go << " ";
    cout << endl;
//size
    cout << a.size() << endl;

    

    return 0;
}
