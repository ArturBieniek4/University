void readlong(long *);

long puzzle6()
{
    long z1;
    readlong(&z1);
    long z2;
    readlong(&z2);
    return 1&(z1%z2==0);
}