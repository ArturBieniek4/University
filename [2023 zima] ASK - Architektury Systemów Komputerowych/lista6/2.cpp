#include <bits/stdc++.h>
//zwaca strukturę która ma min, max i avg w środku
struct T
{
    long min,max,avg;
};
T puzzle2(long *a, long n)
{
    long suma=0;//rax
    long max=LONG_MIN;
    long min=LONG_MAX;
    int i=0;
    for(;i<n;i++)
    {
        long val=*(long *)(n+i*8);
        if(val>max) max=val;
        if(val<min) min=val;
        suma+=val;
    }
    *a=max;
    suma/=i;
    *(a+8)=min;
    *(a+16)=suma;
    return *(T *)a;
}