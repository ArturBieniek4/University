#include <stdint.h>

//11001010
//01010101
//&
//01000000

// 1100101
//01010101
//&
//01000101

//01000000
//01000101
//+
//10000101


uint32_t popcnt(uint32_t x)
{
    x=x&0x55555555+((x>>1) & 0x55555555); // 0101... każde 2 bity mają informację o liczbie zapalonych bitów
    x=x&0x33333333+((x>>2) & 0x33333333); // 00110011... każde 4 bity mają informację o liczbie zapalonych bitów
    x=x&0x0F0F0F0F+((x>>4) & 0x0F0F0F0F); // 00001111... każde 8 bitów ma informację o liczbie zapalonych bitów
    x=x&0x00FF00FF+((x>>8) & 0x00FF00FF); // 0000000011111111... każde 16 bitów ma informację o liczbie zapalonych bitów
    x=x&0x0000FFFF+((x>>16) & 0x0000FFFF); // każde 32 bitów ma informację o liczbie zapalonych bitów
}