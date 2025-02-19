#include <stdio.h>
#include <inttypes.h>

uint32_t puzzle3(uint32_t n, uint32_t d);
/*{
    uint64_t rdi=n; // pierwszy movl tak jakby
    uint64_t rsi=n;
    rsi<<=32;
    uint32_t edx=32;
    uint32_t ecx=0x80000000;
    uint32_t eax=0;
    do
    {
        rdi+=rdi;
        uint64_t r8=rdi;
        r8-=rsi;
        if(r8&0x8000000000000000LL==0)
        {
            eax|=ecx;
            rdi=r8;
        }
        ecx>>=1;
        edx--;
    } while(edx!=0);
    return eax;
}*/

int main()
{
    printf("%u\n",puzzle3(50,2));
    printf("%u\n",puzzle3(20,3));
    printf("%u\n",puzzle3(1000,3));
    return 0;
}