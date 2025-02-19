#include <stdio.h>
#include <inttypes.h>
#include <limits.h>

uint64_t bitrev(uint64_t);

int main() {
    printf("0x%" PRIx64 "\n", bitrev(0b1010000000000000000000000000000001010000000000000000000000000000));
    return 0;
}