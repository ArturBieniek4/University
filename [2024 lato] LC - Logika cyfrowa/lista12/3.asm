sub x5, x28, x29 # i-j
add x5, x5, x10 # A+i-j
lb x6, 0(x5) # A[i-j]
sb x6, 8(x11) # B[8]