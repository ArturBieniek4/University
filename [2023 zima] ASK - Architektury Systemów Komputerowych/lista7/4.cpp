#define CNT 7
#define X_SIZE 4

typedef struct {
    long idx;
    long x[X_SIZE];
} a_struct;
//sizeof(a_struct)=X_SIZE*4+8
typedef struct {
    int first;
    a_struct a[CNT];
    int last;
} b_struct;
//sizeof(b_struct)=sizeof(a_struct)*CNT+16 (inty mają po 4 ale padding dla longów z a_struct)

void test (long i, b_struct *bp) {
    int n = bp->first + bp->last;
    a_struct *ap = &bp->a[i];
    ap->x[ap->idx] = n;
}

long sz_a()
{
    return sizeof(a_struct);
}

long sz_b()
{
    return sizeof(b_struct);
}


/*
test:
movl 288(%rsi),%ecx # ecx=*(bp+288)
addl (%rsi),%ecx # ecx=*(bp+288)+*bp
leaq (%rdi,%rdi,4),%rax # rax=i*5
leaq (%rsi,%rax,8),%rax # rax=bp+i*40 # 40 to rozmiar a_struct
movq 0x8(%rax),%rdx # rdx=bp+i*40+8
movslq %ecx,%rcx # rcx=*(bp+288)+*bp
movq %rcx,16(%rax,%rdx,8) # ((bp+i*40+8)*8+(bp+i*40)+16)=*(bp+288)+*bp
retq
*/