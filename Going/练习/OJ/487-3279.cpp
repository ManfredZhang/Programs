#include <iostream>


using namespace std;

int pow(int a, int b)
{
    int outcome = 1;
    for (int i = 0; i < b; ++i)
    {
        outcome = outcome * a;
    }
    return outcome;
}

int main()
{
    char in[100000][50];
    char temp;
    
    int num;
    cin >>num;
    cin.get();
    
    for (int j=0; j<num; j++)
    {
        for (int i=0;i < 50;i++)
        {
            temp = cin.get();
            
            if (temp == '\n')
                break;
            if (temp == '-')
            {
                i = i-1;
                continue;
            }
            else
            {
                if (temp=='A'||temp=='B'||temp=='C')
                    temp = '2';
                if (temp=='D'||temp=='E'||temp=='F')
                    temp = '3';
                if (temp=='G'||temp=='H'||temp=='I')
                    temp = '4';
                if (temp=='J'||temp=='K'||temp=='L')
                    temp = '5';
                if (temp=='M'||temp=='N'||temp=='O')
                    temp = '6';
                if (temp=='P'||temp=='R'||temp=='S')
                    temp = '7';
                if (temp=='T'||temp=='U'||temp=='V')
                    temp = '8';
                if (temp=='W'||temp=='X'||temp=='Y')
                    temp = '9';
            }
            in[j][i] = temp;
        }
    }


    int z[100000];
    for (int i = 0; i < 100000; ++i)
        z[i] = 6478393;
    for (int i = 0; i < num; ++i)
    {
        z[i] = 0;

        for (int j = 0; j < 7; ++j)
        {
            
            z[i] = z[i] + (in[i][j]-'0') * pow(10,6-j);
        }
    }

    /*for (int i = 0; i < num; ++i)
    {
        cout << z[i] << endl;
    }
    
    
    cout << endl;*/
    
    /*for (int i = 0; i < num; i++)
    {
        bool same = true;
        
        for (int p = 0 ; p < num; p++)
        {
            for (int q = 0; q < 8; q++)
            {
                if (in[i][q] == in[p][q])
                    continue;
                else
                    same = false;
            }
            
            if (same == true)
                count[i]++;
        }
    }*/
    
    
    
    
       
    for (int i=0;i<num-1;i++)  
        for (int j=0;j<num-i-1;j++)  
        {  
            if (z[j]>z[j+1]) // 这里是从大到小排序，如果是从小到大排序，只需将“<”换成“>”  
            {  
                int temporary;  
                temporary=z[j];  
                z[j]=z[j+1];  
                z[j+1]=temporary;  
            }  
        }  



    /*for (int i = 0; i < num; ++i)
    {
        cout << z[i] << endl;
    }
    
    
    cout << endl;*/
  
    int count[100000];
    for (int i=0; i < 100000; i++)
        count[i] = 1;

    int number=0;
    for (int i = 1; i < num+1; ++i)
    {
        if (z[i] == z[i-1])
        {
            count[number] = count[number]+1;
            number--;
        }
        number++;       
    }
    
    z[num] = z[num-1];
    
    if (count[0] != 1)
        cout << z[0]/1000000 << z[0]%1000000/100000 << z[0]%100000/10000 << "-" << z[0]%10000/1000 << z[0]%1000/100 << z[0]%100/10  << z[0]%10 <<" " << count[0] << endl;
    int u=1;
    int k;
    for (int j=0; j<num; j++)
    {
        if (z[j] != z[j+1])
        {
            k = u++;
            if (count[k] != 1)
            {
                cout << z[j+1]/1000000 << z[j+1]%1000000/100000 << z[j+1]%100000/10000 << "-" << z[j+1]%10000/1000 << z[j+1]%1000/100 << z[j+1]%100/10  << z[j+1]%10 << " " << count[k]<< endl;
            }
        }   
    } 


    bool duplicates = true;
    for (int i = 0; i < number; ++i)
    {       
        if (count[i]!=1)
        {
            duplicates = false;
        }
    }

    if (duplicates == true)
    {
        cout << "No duplicates." <<endl;
    }
    
    return 0;
}


