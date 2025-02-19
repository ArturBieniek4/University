#include <bits/stdc++.h>

uint64_t bcd_add(uint64_t a, uint64_t b)
{
    uint64_t res=a+b;
    uint64_t t1=res&0x8888888888888888;
    uint64_t t2=res&0x4444444444444444;
    uint64_t t3=res&0x2222222222222222;
    //10-15
    t2=t2>>1;
    t2=t2|t3;
    t1=t1>>2;
    t1=t1&t2;
    t1=t1>>1;
    //16-18
    t3=a&0x8888888888888888;
    t2=b&0x8888888888888888;
    t3=t3&t2;
    t3=t3>>3;
    
    t1=t1|t3;

    t1*=6;
    res+=t1;
    return res;
}

using namespace std;

int main()
{
    cout<<hex<<bcd_add(0x9999, 0x0009)<<"\n";
    cout<<hex<<bcd_add(0x05, 0x05)<<"\n";
    cout<<hex<<bcd_add(0x09, 0x09)<<"\n";
    return 0;
}