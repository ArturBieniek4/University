#include <bits/stdc++.h>

using namespace std;

/* Oblicz x * 3 / 4 zaokrąglając w dół. */
int32_t threefourths(int32_t x)
{
    // cout<<x*3/4<<"\n";
    int32_t x2=x>>2; // podziel przez 4
    x2=x2+(x2<<1); // pomnóż przez 3
    x2+=(x&0b10)>>1; // jeżeli jest 2 w reszcie to dodaj 1
    x2+=x&0b1&((x&0b10)>>1); // jeżeli jest 3 w reszcie to dodaj 1
    return x2;
}

int main()
{
    cout<<threefourths(-9)<<"\n";

    for(long long i=0;i<INT_MAX;i++)
    {
        if(i*3/4!=threefourths(i))
        {
            cout<<i<<"\n";
            break;
        }
    }
    return 0;
}
