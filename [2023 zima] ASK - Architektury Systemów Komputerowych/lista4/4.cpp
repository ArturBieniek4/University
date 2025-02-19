long decode(long x, long y)
{
    long res=x+y;
    x^=res;
    y^=res;
    res=x;
    res&=y;
    res>>=63;
}