#include <bits/stdc++.h>

using namespace std;

int main()
{
    // int32_t x=INT32_MIN;
    // cout<<((x > 0) || (x - 1 < 0))<<"\n";
    // // to powinno dać false ale z jakiegoś powodu daje true
    
    // x=0b111;
    // cout<<((x & 7) != 7 || (x << 29 < 0))<<"\n";
    // // Żeby pierwsze było false, to 3 ostatnie bity zapalone
    // // Żeby drugie było false, to 3 bit od prawej zapalony
    // // To też powinno dać false ale g++ zabezpiecza przed overflow?
    
    /*for(int32_t x = INT32_MIN; x<=INT32_MAX; x++)
    {
        if(((x & 7) != 7 || (x << 29 < 0))==false)
            cout<<x<<" "<<"((x & 7) != 7 || (x << 29 < 0))"<<"\n";
        
        if(((x > 0) || (x - 1 < 0))==false)
            cout<<x<<" "<<"((x > 0) || (x - 1 < 0))"<<"\n";
        
        if(((x * x) >= 0)==false)
            cout<<x<<" "<<"((x * x) >= 0)"<<"\n";
        
        if((x < 0 || -x <= 0)==false)
            cout<<x<<" "<<"(x < 0 || -x <= 0)"<<"\n";
        
        if((x > 0 || -x >= 0)==false)
            cout<<x<<" "<<"(x > 0 || -x >= 0)"<<"\n";
        
        if(((x | -x) >> 31 == -1)==false)
            cout<<x<<" "<<"((x | -x) >> 31 == -1)"<<"\n";
        
        // if((x + y == (uint32_t)y + (uint32_t)x)==false)
        //     cout<<x<<" "<<"(x + y == (uint32_t)y + (uint32_t)x)"<<"\n";
        
        // if((x * ~y + (uint32_t)y * (uint32_t)x == -x)==false)
        //     cout<<x<<" "<<"(x * ~y + (uint32_t)y * (uint32_t)x == -x)"<<"\n";
        if (x==INT32_MAX) break;
    }*/

    /*
    Wnioski:

    ((x | -x) >> 31 == -1)
    jest fałszem dla x=0
    Obserwacja: x<0 przesunięte >> o 31 = -1
    x>=0 >> o 31 = 0
    x|-x =0 dla x=0
    
    x + y == (uint32_t)y + (uint32_t)x
    Zawsze prawda, bo C++ bitowo porównuje i nie mają znaczenia typy i overflow


    
    */
    int32_t x=100000000;
    int32_t y=1;
    cout<</*x<<" "<<~y<<" "<<x*~y<<" "<<(uint32_t)y*(uint32_t)x<<" "<<*/(x*~y+(uint32_t)y*(uint32_t)x)<<" "<<(uint32_t)-x<<" "<<(x * ~y + (uint32_t)y * (uint32_t)x == -x)<<"\n";
    // ~y = -y-1
    // x*(-y-1) + y*x = -x

    return 0;
}