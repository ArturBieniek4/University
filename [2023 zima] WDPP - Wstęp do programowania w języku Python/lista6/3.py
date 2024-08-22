from math import sqrt, floor

def sito(n):
    n+=1
    isprime=[1]*n
    isprime[0]=0
    isprime[1]=0
    i=2
    while i*i<=n:
        if isprime[i]:
            #print("ISPRIME[",i,']=1')
            for j in range(i*2, n, i):
                isprime[j]=0
                #print("ISPRIME[",j,']=0')
        i+=1
    primes=[]
    for i, p in enumerate(isprime):
        if p:
            primes.append(i)
    return primes

def rozklad(n):
    primes=sito(floor(sqrt(n)))
    sol=[]
    for p in primes:
        if n<p: break
        while n%p==0:
            sol.append(p)
            n//=p
    if n!=1: sol.append(n)
    return set(sol)
print(rozklad(4*27*5*49))