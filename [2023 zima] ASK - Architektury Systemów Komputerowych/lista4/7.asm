mult128:
    movq %rdi, %rax
    movq %rdx, %rbx
    mult %rcx, %rax ;a*d
    ;rdx;rax wynik
    movq %rdx, %rsp
    movq %rax, %rbp
    
    movq %rsi, %rax
    mult %rbx, %rax ; b*c
    add %rax, %rbp
    addc %rdx, %rsp

    movq %rsi, %rax
    mult %rcx, %rax ; b*d
    add %rbp, %rax
    addc %rsp, %rdx