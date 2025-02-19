add128:
    add %rcx, %rsi
    movq %rsi, %rax
    adc %rdi, %rdx
    ret