int puzzle(long x, unsigned n)
{
    //ecx -> lastbit
    //edx -> cnt
    //eax -> sum
    if(n==0)//testl %esi, %esi
    {
        return n;//je .L4
    }
    unsigned cnt=0;//xorl %edx, %edx
    unsigned sum=0;//xorl %eax, %eax
    do
    {
        unsigned lastbit=x;
        lastbit=lastbit&1;
        sum+=lastbit;
        x=x>>1; //sarq %rdi
        cnt++;
    } while(cnt!=n);
    return sum;
}// popcount na n najmłodszych