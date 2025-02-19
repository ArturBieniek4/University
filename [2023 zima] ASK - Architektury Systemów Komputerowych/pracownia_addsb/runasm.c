#include <stdio.h>
#include <inttypes.h>
#include <limits.h>

uint64_t addsb(uint64_t x, uint64_t y);

int main() {
    printf("0x%" PRIx64 "\n", addsb(0xf2, 0xf3));
    return 0;
}