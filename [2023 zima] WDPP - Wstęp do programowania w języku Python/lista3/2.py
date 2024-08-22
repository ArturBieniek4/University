def isPrime(n):
    i=2
    while i*i<=n:
        if n%i==0:
            return False
        i+=1
    return True
N7 = 9
N = 11
sevens=''.join(['7' for i in range(N7)])
liczby=set()
for l in range(N-N7+1):
    r=N-N7-l
    #print("l=", l, "r=", r)
    left=""
    right=""
    firstnum_l=10**(l-1)
    lastnum_l=10**l
    lastnum_r=10**r
    if l==0:
        firstnum_l=0
        lastnum_l=1
    if r==0:
        lastnum_r=1
    for i in range(firstnum_l,lastnum_l):
        left=str(i) if l>0 else ""
        for j in range(0, lastnum_r):
            right=str(j) if r>0 else ""
            right="0"*(r-len(right))+right
            liczba=int(left+sevens+right)
            if isPrime(liczba) and liczba not in liczby:
                liczby.add(liczba)
                print(liczba)
print("Znaleziono", len(liczby), "liczb.")