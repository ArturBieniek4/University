#include <bits/stdc++.h>

using namespace std;

int32_t div3(int32_t x)
{
    int32_t neg = x>>31&1;
    int64_t fp=x;
    int64_t d3=0x55555556;
    int64_t res=(fp*d3)>>32;
    res+=neg;
    // cout<<"res="<<res<<"\n";
    return res;
}

int main()
{
    // float one_third = 1.0f/3.0f;
    // cout<<hex<<(((*(int32_t *)(&one_third)))&(0x007FFFFF))<<"\n";
    for(int i=INT_MIN;i<INT_MAX;i++)
    {
        // cout<<"div3("<<i<<")="<<div3(i)<<"\n";
        assert(div3(i)==i/3);
    }
    return 0;
}
