#include <stdio.h>
#include <inttypes.h>
#include <limits.h>

int clz(uint64_t x);

int main() {
    printf("%d\n", clz(0x00000000e4538fc2));
    return 0;
}
