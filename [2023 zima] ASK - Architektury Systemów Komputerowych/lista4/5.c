#include <cstdint>

uint32_t byteswap(uint32_t x)
{
    uint32_t res=x;
    res&=0x00FF00FF;
    x&=0xFF00FF00;
    res=res<<1;
    x=x>>1;
    res|=x;
    return res;
}