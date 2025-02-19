.cmp:
    cmp %rsi, %rdi
    setne %rax # równe->0, różne->1
    jb .L1 # CF=1, czyli rsi>rdi
    ret
.L1: neg %rax # negacja -1 to 1
    ret