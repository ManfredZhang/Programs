#include <iostream>
#include <cmath>

using namespace std;


class i
{
    float re,im;

    public:
    
    void set_i(float Re,float Im)
    {
        re = Re;
        im = Im;
    }
    void i_plus(i k)
    {
    	re = re + k.re;
    	im = im + k.im;
    }
    void i_subtract(i k)
     {
    	re = re - k.re;
    	im = im - k.im;
    }

    void i_multi(i k)
    {
        re = re * k.re;
        im = im * k.im;
    }

    void i_divide(i k)
    {
        float temp = re;
        re = (re * k.re + im * k.im) / (pow(k.re,2) + pow(k.im,2));
        im = (im * k.re - temp * k.im) / (pow(k.re,2) + pow(k.im,2));
    }

    void i_print()
    {
        if(re < 0 || im < 0)
            cout << "(" << re << ")" << "+" << "(" << im << 'i' << ")";
        cout << re << "+" << im <<'i';
    }
};


int main()
{
    float x,y,w,z;
    char c;
    cin >> x >> y >> w >> z >> c;
    
    i a;
    i b;   
    a.set_i(x,y);
    b.set_i(w,z);
    
    switch (c)
    {
        case'+':
         {
            a.i_plus(b);
            a.i_print();
            cout << endl;
            break;
        }

        case'-':
        {
            a.i_subtract(b);
            a.i_print();
            cout << endl;
            break;
        }

        case'*':
        {
            a.i_multi(b);
            a.i_print();
            cout << endl;
            break;
        }

        case'/':
        {
            a.i_divide(b);
            a.i_print();
            cout << endl;
            break;
        }
    }


    return 0;
}