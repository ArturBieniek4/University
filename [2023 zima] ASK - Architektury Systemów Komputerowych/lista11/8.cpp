#include <bits/stdc++.h>

uint8_t victim(uint8_t state)
{
    return state&0b11000000;
}

uint8_t update(uint8_t state, uint8_t line)
{
    if(state & 0b11 == line) return state;
    else if(state & 0b1100 >> 2 == line) return (state & 0b11110000) | (line << 2) | ((state & 0b00000011) << 2);
    else if(state & 0b110000 >> 4 == line) return (state & 0b11000000) | (line << 4) | ((state & 0b00001111) << 4);
    else if(state & 0b11000000 >> 6 == line) return state << 2 | line;
    else return state << 2 | line; // to nie powinno się nigdy wydarzyć bo stan powinien być zawsze poprawną listą
}