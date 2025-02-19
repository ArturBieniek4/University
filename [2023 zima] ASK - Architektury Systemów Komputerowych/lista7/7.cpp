struct P{
    long a;
    float* b;
};

float puzzle7(struct P * p, float f0)
{
    long a=p->a;
    long b=*p->b;
    long i=0;
    float f1=0;
    float f2=1;
    while(i<a)
    {
        f1=f1+(b+4*i)*f2;
        i++;
        f2*=f0;
    }
    return f1;
}

/*
f2 się mnoży razy b w każdym kroku pętli, więc f2=b^i
b jest tablicą!
to liczy sumę kolejnych wartości tablicy n przemnożonych przez potęgi liczby na wejściu
a to ilość elementów tablicy
*/

/*
rdx->a
rax->res
rcx->b
xmm1->f1
xmm2->f2
puzzle7:
2 movq (%rdi), %rdx
3 leaq 8(%rdi), %rcx
4 xorl %eax, %eax
5 vxorps %xmm1, %xmm1, %xmm1
6 vmovss .LC1(%rip), %xmm2
7 .L2: cmpq %rdx, %rax
8 jge .L5
9 vfmadd231ss (%rcx,%rax,4), %xmm2, %xmm1 # mnoży dwa pierwsze, dodaje do trzeciego i umieszcza w trzecim
10 incq %rax
11 vmulss %xmm0, %xmm2, %xmm2
12 jmp .L2
13 .L5: vmovaps %xmm1, %xmm0
14 ret
15
16 .LC1: .long 0x3f800000
*/