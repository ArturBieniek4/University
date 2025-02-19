#include <bits/stdc++.h>

using namespace std;

int32_t odd_ones(uint32_t x)
{
    int32_t y=x^(x>>1);
    y=y^(y>>2);
    y=y^(y>>4);
    y=y^(y>>8);
    y=y^(y>>16);
    return y&1;
}

int main()
{
    int32_t x=4242;
    cout<<bitset<16>(x)<<" "<<odd_ones(x)<<"\n";
    return 0;
}
