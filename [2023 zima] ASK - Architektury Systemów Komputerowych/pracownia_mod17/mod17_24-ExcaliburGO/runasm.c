#include <stdio.h>
#include <inttypes.h>
#include <limits.h>

uint64_t mod17(uint64_t);

int main() {
    printf("%d", mod17(18));
    return 0;
}