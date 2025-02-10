#include <iostream>
#include <math.h>
#include <iomanip>

using namespace std;

#define PRECISION double

PRECISION f(PRECISION x)
{
    return 1518*((2*x-sin(2*x))/pow(x,3));
}

PRECISION f2(PRECISION x)
{
    PRECISION result=0;
    PRECISION sign=1;
    PRECISION powx=8;
    PRECISION fact=3*2;
    for(int i=3;i<=25;i+=2)
    {
        result+=sign*powx/fact;
        powx*=x*x;
        fact*=(i+1)*(i+2);
        sign*=-1;
    }
    return 1518*(result);
}

int main()
{
    for(int i=1; i<=20; i++)
    {
        cout<<"f(-"<<pow(10,-i)<<")="<<f(pow(10, -i))<<"  ";
        cout<<"f2(-"<<pow(10,-i)<<")="<<f2(pow(10, -i))<<"\n";
    }
    return 0;
}