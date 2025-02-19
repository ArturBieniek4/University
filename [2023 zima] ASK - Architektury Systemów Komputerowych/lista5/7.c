#include <stdio.h>
#include <inttypes.h>

long switch_prob(long x, long n)
{
    long res;
    //rdi -> x
    //rsi -> n
    n-=60;
    if(n>5)
    {
        return x+75;
    }
    switch(n)
    {
        case 0:
            // return x*8;
        case 1:
            return x*8;
        case 2:
            res=x;
            res=res<<4;
            res=res-x;
            x=res;
        case 5:
            x=x*x;
        case 3:
            res=x+4;
            return res;
        case 4:
            res=x;
            res>>=3;
            return res;
    }
}

int main()
{
    // printf("%u\n",puzzle3(50,2));
    // printf("%u\n",puzzle3(20,3));
    // printf("%u\n",puzzle3(1000,3));
    return 0;
}