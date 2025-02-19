/*
 * callmaxofthree.c
 *
 * A small program that illustrates how to call the maxofthree function we wrote in
 * assembly language.
 */

#include <stdio.h>
#include <inttypes.h>

uint32_t maxofthree(uint32_t, uint32_t, uint32_t);

int main() {
    printf("%u\n", maxofthree(1, -4, -7));
    return 0;
}
