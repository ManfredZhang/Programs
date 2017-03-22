#include <iostream>
using namespace std;

class code
{
private:
    string s1,s2,s3,s4,s5;
    string ss;
    
public:
    int which;
    bool get();
    void trans1();
    void trans2andoutput();
    //void output1();
    void output2();
    bool check1();
    bool check2();
};

bool code::get()
{
    string temp;
    while (cin >> temp)
    {
        char test;
        test = cin.get();
        if (test == ' ')
        {
            s1 = temp;
            cin >> s2 >> s3 >> s4 >> s5;
            which = 1;
            return true;
        }
        else
        {
            ss = temp;
            which = 2;
            return true;
        }
    }
    return false;
}

void code::trans1()
{
    int sss[5];
    sss[0] = 7*(s1[0]-'0') + 4*(s1[1]-'0') + 2*(s1[2]-'0') + 1*(s1[3]-'0');
    sss[1] = 7*(s2[0]-'0') + 4*(s2[1]-'0') + 2*(s2[2]-'0') + 1*(s2[3]-'0');
    sss[2] = 7*(s3[0]-'0') + 4*(s3[1]-'0') + 2*(s3[2]-'0') + 1*(s3[3]-'0');
    sss[3] = 7*(s4[0]-'0') + 4*(s4[1]-'0') + 2*(s4[2]-'0') + 1*(s4[3]-'0');
    sss[4] = 7*(s5[0]-'0') + 4*(s5[1]-'0') + 2*(s5[2]-'0') + 1*(s5[3]-'0');
    
    for (int i = 0; i < 5; i++)
    {
        if (sss[i] == 11)
            sss[i] = 0;
    }
    
    for (int i = 0; i < 5; i++)
    {
        ss[i] = sss[i] + '0';
    }
}

void code::trans2andoutput()
{
    for (int i = 0; i < 5; i++)
    {
        if (ss[i] == '0')
            cout << "11000";
        if (ss[i] == '1')
            cout << "00011";
        if (ss[i] == '2')
            cout << "00101";
        if (ss[i] == '3')
            cout << "00110";
        if (ss[i] == '4')
            cout << "01001";
        if (ss[i] == '5')
            cout << "01010";
        if (ss[i] == '6')
            cout << "01100";
        if (ss[i] == '7')
            cout << "10001";
        if (ss[i] == '8')
            cout << "10010";
        if (ss[i] == '9')
            cout << "10100";
        if (i != 4)
            cout << " ";
        
    }
}

/*void code::output1()
{
    cout << s1 << " " << s2 << " " << s3 << " " << s4 << " " << s5 << endl;
}*/

void code::output2()
{
    for (int i = 0; i < 5; i++)
    {
        cout << ss[i];
    }
    cout << endl;
}

bool code::check1()
{
    //if (s1[0] != '1')
      //  return false;
    int count = 0;
    for (int i = 0; i < 5; i++)
    {
        if (s1[i] == '1')
            count++;
        else if (s1[i] != '0')
            return false;
    }
    if (count != 2)
        return false;
    else
        count = 0;
    
    for (int i = 0; i < 5; i++)
    {
        if (s2[i] == '1')
            count++;
        else if (s2[i] != '0')
            return false;
    }
    if (count != 2)
        return false;
    else
        count = 0;
    
    for (int i = 0; i < 5; i++)
    {
        if (s3[i] == '1')
            count++;
        else if (s3[i] != '0')
            return false;
    }
    if (count != 2)
        return false;
    else
        count = 0;
    
    for (int i = 0; i < 5; i++)
    {
        if (s4[i] == '1')
            count++;
        else if (s4[i] != '0')
            return false;
    }
    if (count != 2)
        return false;
    else
        count = 0;
    
    for (int i = 0; i < 5; i++)
    {
        if (s5[i] == '1')
            count++;
        else if (s5[i] != '0')
            return false;
    }
    if (count != 2)
        return false;
    else
        count = 0;
    
    //if (s5[4] != '1')
      //  return false;
    
    return true;
}

bool code::check2()
{
    for (int i = 0; i < 5; i++)
    {
        if (ss.size() > 5)
            return false;
    }
    return true;
}




int main()
{
    code a[1001];
    int time = 0;
    while (a[time].get())
        time++;
    
    for (int i = 0; i < time; i++)
    {
        if (a[i].which == 1)
        {
            if (a[i].check1() == false)
                cout << "error" << endl;
            else
            {
                a[i].trans1();
                a[i].output2();
            }
        }
        else
        {
            if (a[i].check2() == false)
                cout << "error" << endl;
            else
            {
                a[i].trans2andoutput();
                cout << endl;
            }
        }
    }
    
    return 0;
}