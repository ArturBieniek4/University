//B od 5 do 8
//A od 7 do 10
//
#define A 9
#define B 5

typedef struct {
int x[A][B];
long y;
} str1;

typedef struct {
char array[B];
int t;
short s[A];
long u;
} str2;

void set_val(str1 *p, str2 *q) {
long v1 = q->t;
long v2 = q->u;
v2+=v1;
p->y = v2;
}

/*
set_val:
movslq 8(%rsi),%rax
addq 32(%rsi),%rax
movq %rax,184(%rdi)
ret
*/