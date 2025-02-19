#include <stdio.h>
#include <inttypes.h>

typedef long (*FuncPtr)();
void posrednie(long rdi, long rsi)
{
    FuncPtr targetFunc = (FuncPtr)(rdi+8*rsi);
    targetFunc();
}