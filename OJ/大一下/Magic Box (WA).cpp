#include <iostream>
#include <vector>
#include <algorithm>
using namespace std;

bool match(int a, int b, int c, int A, int B, int C)
{
    if (a == A && b == B && c == C)
        return true;
    if (a == A && b == C && c == B)
        return true;
    if (a == B && b == A && c == C)
        return true;
    if (a == B && b == C && c == A)
        return true;
    if (a == C && b == A && c == B)
        return true;
    if (a == C && b == B && c == A)
        return true;
    return false;
}

int absolute(int a)
{
    if (a < 0)
        return -a;
    else
        return a;
}

int compare(int a, int b)
{
    if (a > b)
        return a;
    else
        return b;
}

int main()
{
    int a,b,c;
    cin >> a >> b >> c;
    
    vector<char> sequence;
    
    string situation;
    cin >> situation;
    
    for (int i = 0; i < 20000; i++)
    {
        sequence.push_back(situation[i]);
        if (sequence[i] != 'R' && sequence[i] != 'Y' && sequence[i] != 'B')
            break;
    }
    sequence.resize(sequence.size() - 1);
    
    
    int a_now = 0;
    int b_now = 0;
    int c_now = 0;
    vector<int> max;
    int size_now = 0;
    
    for (int i = 0; i < sequence.size(); i++)
    {
        if (sequence[i] == 'R')
        {
            a_now++;
            c_now--;
        }
        if (sequence[i] == 'Y')
        {
            a_now--;
            b_now++;
        }
        if (sequence[i] == 'B')
        {
            b_now--;
            c_now++;
        }
        
        size_now++;
        
        if (match(absolute(a_now),absolute(b_now),absolute(c_now),a,b,c))
        {
            max.push_back(size_now);
            size_now = 0;
            a_now = 0;
            b_now = 0;
            c_now = 0;
        }
    }
    
    sort(max.begin(),max.end());
    
    if (max.size() == 0)
        cout << size_now << endl;
    else
        cout << max[max.size()-1] << endl;
    
    return 0;
}