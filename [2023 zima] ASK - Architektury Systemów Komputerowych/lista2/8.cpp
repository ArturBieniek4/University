#include <bits/stdc++.h>

using namespace std;

int32_t sign(int32_t x)
{
    int32_t positive = (~(x>>31)&1); // 1 dla x>0, 0 wpp
    int32_t notzero = ((x>>31)^(-x>>31))&1;
    return (notzero+positive-((~positive)&1))-1;
}

int main()
{
    int32_t x=1;
    cout<<(sign(x))<<"\n";
    return 0;
}
