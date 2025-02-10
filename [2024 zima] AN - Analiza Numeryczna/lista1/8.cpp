#include <iostream>
#include <iomanip>
#include <math.h>

using namespace std;

#define PRECISION double

PRECISION mylog2(PRECISION x)
{
    int modifier=0;
    while(x<1)
    {
        modifier--;
        x*=2;
    }
    while(x>2)
    {
        modifier++;
        x/=2;
    }
    return log2(x)+modifier;
}

int main()
{
    // cout<<setprecision(5)<<fixed;
    for(PRECISION n=777; n>=1.0/1024.0; n/=2.0)
    {
        cout<<(PRECISION)n<<" "<<mylog2(n)<<" "<<log2(n)<<"\n";
    }
    return 0;
}