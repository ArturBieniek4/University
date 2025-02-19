#include <bits/stdc++.h>

using namespace std;

int main()
{
    int32_t x=2,y=5;
    // x=x+y;
    // y=x-y;
    // x=x-y;
    
    // x=x^y;
    // y=y^x;
    // x=x^y;

    x=x^y^(y=x);
    cout<<x<<" "<<y<<"\n";
}
