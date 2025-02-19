#include <bits/stdc++.h>

using namespace std;

int main()
{
    int32_t x=2,y=3;
    cout<<-(((x-y)^((x^y)&((x-y)^x)))>>31)<<"\n";
    return 0;
}
