#include <iostream>
#include <math.h>
#include <iomanip>

using namespace std;

#define PRECISION double

PRECISION pi_wyraz(int k)
{
    return (k%2 ? -1 : 1)/(2.0*k+1);
}

int main()
{
    cout<<setprecision(20)<<fixed;
    PRECISION suma=0;
    for(int i=0;i<2000000;i++)
    {
        PRECISION wyraz=pi_wyraz(i);
        suma+=wyraz;
        cout<<suma*4<<" "<<abs(M_PI-suma*4)<<"\n";
        if(abs(M_PI-suma*4)<1/1000000.0)
        {
            cout<<"k="<<i<<"\n";
            break;
        }
    }
    return 0;
}