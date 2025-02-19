#include <bits/stdc++.h>

using namespace std;

int main()
{
    float f=-1.0f;
    uint32_t x;
    int32_t i=-4;
    memcpy(&x,&f,sizeof(float));
    int32_t cecha=((x>>23)&0xFF);
    cout<<cecha<<"\n";
    cecha=cecha+i;
    if(i>0)
    {
        if(cecha>=255) cecha=255;
    }
    else
    {
        if(cecha<0) cecha=0;
    }
    cout<<cecha<<"\n";
    cecha=cecha<<23;
    x=(x&0x807FFFFF)|cecha;
    memcpy(&f,&x,sizeof(float));
    cout<<setprecision(50)<<fixed<<f<<"\n";
    return 0;
}
