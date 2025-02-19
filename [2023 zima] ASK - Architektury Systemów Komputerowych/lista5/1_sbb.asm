.addu:
    add %rdi, %rsi
    sbb %rax, %rax
    or %rsi, %rax
    ret