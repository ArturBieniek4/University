aframe(long, long, long*):
        pushq   %rbp
        movq    %rsp, %rbp # zapisanie starego stack pointera
        subq    $16, %rsp
        leaq    15(,%rdi,8), %rax # obliczanie rozmiaru tablicy
        andq    $-16, %rax # podzielność przez 16
        subq    %rax, %rsp # rozszerzenie stacka o rozmiar tablicy
        movq    %rsp, %rcx
        leaq    -8(%rbp), %rax
        movq    %rax, -8(%rcx,%rdi,8)
        movq    $0, -8(%rbp)
        jmp     .L2
.L3:
        movq    %rdx, (%rcx,%rax,8)
        addq    $1, -8(%rbp)
.L2:
        movq    -8(%rbp), %rax
        cmpq    %rdi, %rax
        jl      .L3
        movq    (%rcx,%rsi,8), %rax
        movq    (%rax), %rax
        leave # ebp -> esp; pop esp czyli przywrócenie starego stack pointera
        ret