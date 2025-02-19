#include <bits/stdc++.h>

using namespace std;

int main()
{
    float f=-0.0f;
    float g=0.0f;
    cout<<(f<g)<<"\n";
    return 0;
    uint32_t x,y;
    memcpy(&x,&f,sizeof(float));
    memcpy(&y,&g,sizeof(float));
    // x=x^(1<<31); // 1.
    // cout<<"-"<<(127-(x>>23))<<"\n"; //2
    // cout<<(x==y || ((x==0x80000000)&(y==0)) || ((y==0x80000000)&(x==0)))<<"\n"; //3
    cout <<
    ((~((x&(1<<31)==0)&(y&(1<<31)==1))) // false jeżeli f>0 g<0
    & (//w tym bloku true
    ((x&(1<<31)==0)&(y&(1<<31)==1))
    // true jeżeli f<0 g>0
    |
    (((int32_t)(x>>23)-(int32_t)(y>>23))>>31!=0)//mantysa większa f>g
    |
    //mantysy równe i cecha większa
    (((x>>23)==(y>>23)))
    &
    (((int32_t)(x&0x00788888)-(int32_t)(y&0x00788888))>>31!=0)//cecha większa f>g
    ))<<" ";
    // (f>=0 & f<g) | (f<0 & f>u & f>g) & ((f|g)!=0x80000000)
    memcpy(&f,&x,sizeof(float));
    memcpy(&g,&y,sizeof(float));
    cout<<setprecision(3)<<fixed<<f<<" "<<g<<"\n";
    return 0;
}
