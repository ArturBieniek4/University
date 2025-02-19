#include <cstdlib>

void foobar(long a[], size_t n, long y, long z)
{
    long x = y-z;
    int i=0;
    long x2=x*x;
    while(i<n)
    {
        a[i]=x2;
        i++;
        x2+=7;
    }
}