#include <bits/stdc++.h>

using namespace std;

int32_t int2float(int32_t i)
{
    if(i==0) return 0;
    uint32_t ui = i;
    uint32_t res;
    res=ui&(1<<31);//skopiuj znak
    if(res!=0) ui=-ui; // wywal znak z i;
    // cout<<ui<<"\n";
    uint32_t wykladnik=32-__builtin_clz(ui)-1;
    uint32_t expo=127+wykladnik;
    // cout<<wykladnik<<" "<<expo<<"\n";
    uint32_t wartosc_expo=2<<(wykladnik-1);
    expo=expo<<23;
    res=res|expo;
    // cout<<wartosc_expo<<"\n";
    uint32_t wartosc_mantysy=ui-wartosc_expo;
    uint32_t sticky=0;
    uint32_t guard=0;
    uint32_t r=0;
    uint32_t mantysa=0;
    for(uint32_t s=0;s<32;s++)
    {
        uint32_t i = (1<<s);
        if(wartosc_expo/i!=0 & wartosc_expo/i<=wartosc_mantysy)
        {
            // cout<<1;
            wartosc_mantysy-=wartosc_expo/i;
            if(s==23) guard=1;
            if(s==24) r=1;
            if(s<=23)
                mantysa=mantysa|(1<<(23-s));
            if(s>24)
            {
                sticky=1;
                break;
            }
        }
        // else cout<<0;
    }
    // cout<<"\n"<<guard<<" "<<sticky<<" "<<r<< " "<<"\n";
    if(r&sticky | guard&r)
    {
        // cout<<"ROUNDUP\n";
        mantysa+=1;
    }
    res=res+mantysa;
    // cout<<((bitset<32>)res)<<"\n";
    // cout<<mantysa<<"\n";
    return res;
}

int main()
{
    int32_t x=33554431;
    // int32_t x=12;
    float i;
    x=int2float(x);
    memcpy(&i,&x,sizeof(float));
    cout<<setprecision(3)<<fixed<<i<<"\n";
    for(int32_t i=INT_MIN;i<INT_MAX;i++)
    {
        int32_t x=i;
        float wzor=x;
        float res;
        x=int2float(x);
        memcpy(&res,&x,sizeof(float));
        // cout<<setprecision(3)<<fixed<<i<<"\n";
        if(res!=wzor)
        {
            cout<<"ERR"<<i<<" "<<res<<" "<<wzor<<"\n";
            break;
        }
    }
    return 0;
}