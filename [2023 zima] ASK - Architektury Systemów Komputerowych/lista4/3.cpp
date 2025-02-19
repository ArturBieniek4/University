#include <bits/stdc++.h>

using namespace std;

int32_t float_to_16(float x)
{
    int32_t bin = *(int32_t *) &x;
    int32_t res=bin&0xFFFF;
    return res;
}

int main()
{
    int32_t alfa = float_to_16(0.3);
    cout<<hex<<alfa<<"\n";
    return 0;
}