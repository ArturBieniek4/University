#define R 7
#define S 5
#define T 13
//sizeof(A)=3640
//T=13
//S*T=65
//65*R*8=3640
//R=7
long A[R][S][T];

long store_elem(long i, long j, long k, long *dest)
{
    *dest = A[i][j][k];
    return sizeof(A);
}

/*
store_elem:
leaq (%rsi,%rsi,2),%rax # rax=j*3
leaq (%rsi,%rax,4),%rax # rax=j*13
movq %rdi,%rsi
salq $6,%rsi # rsi=i*64
addq %rsi,%rdi # rdi=i*65
addq %rax,%rdi # rdi=i+i*64+j*13
addq %rdi,%rdx # rdx=k+i+i*64+j*13
movq A(,%rdx,8),%rax # rax=(k+i+i*64+j*13)*8+A
movq %rax,(%rcx) # zwróć rax przez ref
movq $3640,%rax # zwróć rozmiar całej struktury
ret
*/