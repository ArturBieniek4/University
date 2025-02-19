#include <bits/stdc++.h>

using namespace std;

// w 11 podzielna przez 16, bo mamy 8*3+1*8 na adres powrotu

long pointless(long n, long *p)
{
    //callee-save: r14, rbx
    //zapisany rax chuj wie po co
    long *r14=p;
    long rbx=n;
    long result;
    if(n<=0)
    {//L1
        result=0;
    }
    else
    {
        n=rbx*2;
        p=&result;
        result = pointless(n,p);
        result+=result;
    }
    // L3
    rbx+=result;
    *r14=rbx;
    return result;
}

long pointless(long n, long *p) {
    long result = 0;
    if (n > 0) {
        n += n;
        result = pointless(n, p);
    }
    *p = result;
    return result + n;
}