#include <iostream>
#include <math.h>
#include <iomanip>

using namespace std;

#define PRECISION double

PRECISION f(int MAXN)
{
    PRECISION prev=2;
    PRECISION mult=2;
    for(int i=2;i<=MAXN;i++)
    {
        prev=mult*sqrt(2*(1-sqrt(1-pow(prev/mult,2))));
        mult*=2;
        cout<<"x["<<i<<"]="<<prev<<"\n";
    }
    return prev;
}

PRECISION f2(int MAXN)
{
    PRECISION prev=2;
    PRECISION mult=2;
    for(int i=2;i<=MAXN;i++)
    {
        prev=mult*sqrt(2*pow(prev/mult, 2)/(1+sqrt(1-pow(prev/mult, 2))));
        mult*=2;
        cout<<"x["<<i<<"]="<<prev<<"\n";
    }
    return prev;
}

int main()
{
    f(30);
    f2(100);
    return 0;
}