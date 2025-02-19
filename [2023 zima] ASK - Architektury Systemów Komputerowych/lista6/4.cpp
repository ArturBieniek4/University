// Problem #1 - nie popujemy stacka na końcu
// Problem #2 - procedura F nie savuje r12
long M(long p)
{
    long zmienna=p;
    if(p==0)
    {
        return p;
    }
    else
    {
        p--;
        p=M(p);
        p=zmienna-F(p);
        return p;
    }
}

long F(long p)
{
    if(p==0)
    {
        return 1;
    }
    else
    {
        long r12=p;
        p--;
        p=F(p);
        r12-=M(p);
        return r12;
    }
}