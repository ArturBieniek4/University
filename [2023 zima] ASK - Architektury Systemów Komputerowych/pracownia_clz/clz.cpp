#include <bits/stdc++.h>

using namespace std;

int main()
{
    uint64_t x=0b001101;
    x |= (x>>1);
    x |= (x>>2);
    x |= (x>>4);
    x |= (x>>8);
    x |= (x>>16);
    x |= (x>>32);
    cout<<(bitset<64>)x<<"\n";
    // popcount z listy 1 zadanie 2
    x=(x&0x5555555555555555)+((x>>1) & 0x5555555555555555); // 0101... każde 2 bity mają informację o liczbie zapalonych bitów
    x=(x&0x3333333333333333)+((x>>2) & 0x3333333333333333); // 00110011... każde 4 bity mają informację o liczbie zapalonych bitów
    x=(x&0x0F0F0F0F0F0F0F0F)+((x>>4) & 0x0F0F0F0F0F0F0F0F); // 00001111... każde 8 bitów ma informację o liczbie zapalonych bitów
    x=(x&0x00FF00FF00FF00FF)+((x>>8) & 0x00FF00FF00FF00FF); // 0000000011111111... każde 16 bitów ma informację o liczbie zapalonych bitów
    x=(x&0x0000FFFF0000FFFF)+((x>>16) & 0x0000FFFF0000FFFF); // każde 32 bitów ma informację o liczbie zapalonych bitów
    x=(x&0x00000000FFFFFFFF)+((x>>32) & 0x00000000FFFFFFFF); // każde 64 bitów ma informację o liczbie zapalonych bitów
    cout<<64-x<<"\n";
    return 0;
}