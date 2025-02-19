byteswap:
    movl %edi, %eax
    andl $0x00FF00FF, %eax
    andl $0xFF00FF00, %edi
    shl $1, %eax
    shr $1, %edi
    orl %edi, %eax
    rol $2, %eax