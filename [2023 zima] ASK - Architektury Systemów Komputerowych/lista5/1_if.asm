.addu:
    mov %rsi, %rax
    add %rdi, %rax
    jc overflow # jump if carry
    ret

.addu_overflow:
    mov $4294967295, %rax