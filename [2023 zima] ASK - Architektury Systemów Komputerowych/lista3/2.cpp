#include <bits/stdc++.h>

using namespace std;

int64_t x[] = {0x55555556, 0, 0, 0x55555556};
int64_t y[] = {0, 0x55555556, 0x55555556, 0};
int64_t k=1;
int64_t len = 2<<(k-1);

int main()
{
    int64_t odwrotnosc_n = ((1ll<<32)/len);
    cout<<"odwrotnosc_n="<<odwrotnosc_n<<"\n";
    int64_t suma=0;
    double suma2=0;
    for(int i=0;i<len;i++)
    {
        suma+=((x[i]-y[i])*(x[i]-y[i]))>>32;
        suma2+=(((double)x[i]-(double)y[i])*((double)x[i]-(double)y[i]));
    }
    suma=suma*odwrotnosc_n;
    suma=suma<<k;
    cout<<(double)suma<<"\n";
    cout<<suma2<<"\n";
    return 0;
}
