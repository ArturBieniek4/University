#include <bits/stdc++.h>

using namespace std;

int main()
{
    uint64_t x=0x00000000e4538fc2;
    int res=0;
    if(x<=0xFFFFFFFF)
    {
        x=x<<32;
        res+=32;
    }
    cout<<res<<"\n";
    cout<<(bitset<64>)x<<"\n";
    if(x<=0xFFFFFFFFFFFF)
    {
        x=x<<16;
        res+=16;
    }
    cout<<res<<"\n";
    cout<<(bitset<64>)x<<"\n";
    if(x<=0xFFFFFFFFFFFFFF)
    {
        x=x<<8;
        res+=8;
    }
    cout<<res<<"\n";
    cout<<(bitset<64>)x<<"\n";
    if(x<=0xFFFFFFFFFFFFFFF)
    {
        x=x<<4;
        res+=4;
    }
    cout<<res<<"\n";
    cout<<(bitset<64>)x<<"\n";
    if(x<=0x3FFFFFFFFFFFFFFF)
    {
        x=x<<2;
        res+=2;
    }
    cout<<res<<"\n";
    cout<<(bitset<64>)x<<"\n";
    if(x<=0x7FFFFFFFFFFFFFFF)
    {
        x=x<<1;
        res+=1;
    }
    if(x==0) res++;
    cout<<res<<"\n";
    return 0;
}