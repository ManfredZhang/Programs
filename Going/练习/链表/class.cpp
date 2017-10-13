#include <iostream>
using namespace std;

class BankAccount
{
private:
    double balance;
    double interest_rate;
    double fraction(double percent);
    
public:
    void set(int dollars, int cent, double rate);
    void set(int dollars, double rate);
    void update();
    double get_balance();
    double get_rate();
    void output(ostream& outs);
};

int main()
{
    BankAccount Manfred, Lucia;
    cout << "Start of test:\n";
    Manfred.set(123,99,3.0);
    cout << "Manfred initial statement:\n";
    Manfred.output(cout);
    Manfred.set(100,5.0);
    cout << "Manfred with new setup:\n";
    Manfred.output(cout);
    
    Manfred.update();
    cout << "account1 after update:\n";
    Manfred.output(cout);
    
}

