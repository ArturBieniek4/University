#include <iostream>
#include <iomanip>
#include <math.h>

using namespace std;

#define PRECISION double
#define IMAX 21

PRECISION mysin(PRECISION x)
{
    PRECISION result=0;
    PRECISION sign=1;
    PRECISION powx=x;
    PRECISION fact=1;
    for(int i=1;i<=IMAX;i+=2)
    {
        result+=sign*powx/fact;
        powx*=x*x;
        fact*=(i+1)*(i+2);
        sign*=-1;
    }
    return result;
}

int main()
{
    cout<<setprecision(10)<<fixed;
    PRECISION maxdev=0;
    for(PRECISION x=0.0; x<=M_PI; x+=0.00001)
    {
        PRECISION dev=abs(mysin(x)-sin(x));
        maxdev=max(dev, maxdev);
        cout<<"sin("<<x<<")="<<mysin(x)<<" | "<<sin(x)<<"\n";
    }
    cout<<"MAX DEVIATION:"<<maxdev<<"\n";
    return 0;
}