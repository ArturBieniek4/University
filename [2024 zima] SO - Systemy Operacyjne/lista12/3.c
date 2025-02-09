bool compare_and_swap(long* var, long old, long new)
{
    if(*var==old)
    {
        *var=new;
        return true;
    }
    else return false;
}

typedef spin_t int;
spin_t spinlock;

void lock(spin_t *spinlock)
{
    while(!compare_and_swap(spinlock, 0, 1)) ;
}

void unlock(spin_t *spinlock)
{
    compare_and_swap(spinlock, 1, 0);
}