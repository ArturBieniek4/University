#include <bits/stdc++.h>

using namespace std;

int32_t float2int(int32_t f)
{
    int32_t s = f>>31; // -1 jeśli znak był ujemny
    int32_t e = (f>>23&255)-127; // wykładnik-bias
    uint32_t m = f<<8 | 0x80000000; // mantysa 1.xxx... dosunięta do lewej
    cout<<e<<" "<<(bitset<32>)m<<"\n";
    // czyli pierwszy bit zapalony i dalej mantysa
    if(e>=31) return INT_MIN;
    else
    {
        if(e<0) return 0;
        else m=m>>(31-e);
        if(s==-1) return -m;
        return m;
    }
}

int main()
{
    int32_t x;
    float i=1.0f;
    x=*(int32_t *)&i;
    // memcpy(&i,&x,sizeof(float));
    x=float2int(x);
    cout<<x<<"\n";
    for(int32_t i=1;i<INT_MAX;i++)
    {
        float x=1.0f;
        int32_t wzor=x;
        int32_t res;
        res=float2int(x);
        // cout<<setprecision(3)<<fixed<<i<<"\n";
        if(res!=wzor)
        {
            cout<<"ERR"<<i<<" "<<res<<" "<<wzor<<"\n";
            break;
        }
    }
    return 0;
}