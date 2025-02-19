#include <bits/stdc++.h>

using namespace std;

int main()
{
    int32_t x=INT_MAX,y=1,s;
    // x<y : (x-y)^((x^y)&((x-y)^x))
    s=x+y;
    cout<<"NADMIAR/NIEDOMIAR:"<<-(((x^s)&(y^s))>>31)<<"\n";
    //każdy bit tego jest 1 wtw
    //s=0, x=1, y=1
    //LUB s=1, x=0, y=0
    //czyli to wyrażenie dla każdego bitu mówi czy wystąpiło na niego carry
    //chcemy wiedzieć czy było carry na najstarszy bit
}
