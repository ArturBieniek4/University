union elem {
    struct {
        long *p; // 8
        long y; // 8
    } e1; // 16
    struct {
        long x; // 8
        union elem *next; // 8
    } e2; // 16
};//16

union elem* proc(union elem *a)
{
    union elem *res=a->e2.next;

    long t=*(res->e1.p);

    t-=res->e1.y;

    res->e2.x=t;

    return res;
}

/*
rax->res
rdi->a
rdx->t
proc:
movq 8(%rdi),%rax # obliczamy adres+1, więc rax musi być pointerem, będzie e2.next

movq (%rax),%rdx # rax daje wskaźnik na coś, jest to pierwszy element więc na p
movq (%rdx),%rdx # dereferencja

subq 8(%rax),%rdx # od rdx odejmujemy *(rax+8) czyli *(res.y)

movq %rdx,(%rdi) # rdx wstawiamy do *a, czyli do e2.x

ret
*/