#include <stdio.h>
#include <inttypes.h>

long puzzle4(long *a, long v, uint64_t s, uint64_t e)
{
    //rdi->a
    //rsi->v
    //rdx->s
    //rcx->e
    long res;//rax
    res=e;
    res-=s;
    res=res/2;//shrq
    res+=s;
    if(e<s)
    {
        return 0xFFFFFFFF;
    }
    long r8;
    r8=*(a+res*8);
    if(v==r8) return res;
    if(r8>v) return puzzle4(a, v, s, res-1);
    return puzzle4(a,v,res+1,e);
}

int main()
{
    // printf("%u\n",puzzle3(50,2));
    // printf("%u\n",puzzle3(20,3));
    // printf("%u\n",puzzle3(1000,3));
    return 0;
}