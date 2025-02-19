typedef struct A {
    long u[2];
    long *v;
} SA;

typedef struct B {
    long p[2];
    long q;
} SB;

SB eval(SA s)
{
    long x=s.u[0], y=s.u[1], z=*s.v; 
    SB result;
    result.p[0]=z*x;
    result.p[1]=x-z;
    result.q=x-y;
    return result;
}
    
long wrap(long x, long y, long z)
{
    SA t;
    t.u[1]=y;
    t.v=&z;
    t.u[0]=x;

    SB sb = eval(t);
    
    return (sb.p[1] + sb.p[0]) * sb.q;
}

/*
10 eval:
11 movq %rdi, %rax
12 movq 16(%rsp), %rcx
13 movq 24(%rsp), %rdx
14 movq (%rdx), %rsi
15 movq %rcx, %rdx
16 imulq %rsi, %rdx
17 movq %rdx, (%rdi)
18 movq 8(%rsp), %rdx
19 movq %rdx, %rdi
20 subq %rsi, %rdi
21 movq %rdi, 8(%rax)
22 subq %rcx, %rdx
23 movq %rdx, 16(%rax)
24 ret


25 wrap:
26 subq $72, %rsp
27 movq %rdx, (%rsp)
28 movq %rsp, %rdx
29 leaq 8(%rsp), %rax
30 pushq %rdx
31 pushq %rsi
32 pushq %rdi
33 movq %rax, %rdi
34 call eval
35 movq 40(%rsp), %rax
36 addq 32(%rsp), %rax
37 imulq 48(%rsp), %rax
38 addq $96, %rsp
39 ret
*/