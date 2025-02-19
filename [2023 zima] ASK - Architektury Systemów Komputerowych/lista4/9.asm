bcd_add:
    movq %rsi,%rax
    add %rdi, %rax
    mov %rax, %r8
    mov %rax, %r9
    mov %rax, %r10
    shr $1, %r9
    or %r10, %r9
    shr $2, %r8
    and %r9, %r8
    ;shr $1, %r8

    mov %rsi, %r10
    and 0x8888888888888888, %r10
    mov %rdi, %r9
    and 0x8888888888888888, %r9
    and %r9, %r10
    ;shr $3, %r10
    shr $2, %r10

    or %r10, %r8
    lea (%r8, %r8, 2), %rax ; r8 *3, wcześniej bitshifty -1 czyli *2
    add %r8, %rax