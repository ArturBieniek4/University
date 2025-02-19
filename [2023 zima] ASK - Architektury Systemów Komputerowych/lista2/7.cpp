#include <bits/stdc++.h>

using namespace std;

int32_t abs(int32_t x)
{
    int32_t sgn = (x>>31); //-1 to ujemne, 0 to dodatnie
    // cout<<sgn<<"\n";
    // x*()
    return x+x*2*sgn;
}

int main()
{
    int32_t x=-42;
    cout<<abs(x)<<"\n";
    return 0;
}
