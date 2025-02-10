#include <iostream>
#include <math.h>
#include <iomanip>

using namespace std;

#define PRECISION double

PRECISION f(PRECISION x)
{
    return 1518*((2*x-sin(2*x))/pow(x,3));
}

int main()
{
    for(int i=1; i<=20; i++)
    {
        cout<<setprecision(50)<<fixed;
        PRECISION val=f(pow(10, -i));
        cout<<"f(-"<<pow(10,-i)<<")="<<val<<"\n";
    }
    return 0;
}