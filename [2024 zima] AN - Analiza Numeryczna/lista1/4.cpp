#include <iostream>
#include <math.h>
#include <iomanip>

using namespace std;

#define PRECISION float

PRECISION y(int n)
{
    if(n==0) return 1.0;
    if(n==1) return -1.0/6.0;
    return (35.0/6.0)*(y(n-1))+y(n-2);
}

int main()
{
    cout<<setprecision(50)<<fixed;
    for(int i=0; i<=50; i++)
    {
        PRECISION val=y(i);
        cout<<"f("<<i<<")="<<val<<"\n";
    }
    return 0;
}