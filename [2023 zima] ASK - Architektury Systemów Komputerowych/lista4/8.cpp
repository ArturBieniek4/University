#include <bits/stdc++.h>

uint32_t toupper(uint32_t i) {
    uint32_t x=i&0xDFDFDFDFDFDFDFDF;
    uint32_t y = i+5;
    y=y&0x8080808080808080;
    uint32_t z=i+31;
    z=~z;
    z=z&0x8080808080808080;
    z=z&y;
    z=z>>2;
    x=i&z;
    return x;
}