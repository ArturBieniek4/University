n, a, b, c = map(int, input().split())
wynik=[0 for i in range(n+1)]
mozna=[False for i in range(n+1)]
mozna[n]=True
for i in range(n, 0, -1):
    if mozna[i]:
        ra=i-a
        rb=i-b
        rc=i-c
        for r in [ra,rb,rc]:
            if r>=0:
                mozna[r]=True
                wynik[r]=max(wynik[r], wynik[i]+1)
print(wynik[0])
