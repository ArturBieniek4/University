#include<bits/stdc++.h>

long puzzle2(char *s, char *d)
{
    char *rax = s;
    //L3
    do
    {
        char r9b=*rax;
        char *r8=rax+1;
        char *rdx=d;
        //L2
        char cl;
        do
        {
            cl=*rdx;
            rdx++;
            if(cl==0)
            {
                return rax-s;//L4
            }
        }
        while(cl!=r9b);
        rax=r8;
    }
    while (true);
}