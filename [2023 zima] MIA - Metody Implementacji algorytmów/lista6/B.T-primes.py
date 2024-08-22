from math import sqrt, floor
n=int(input())
liczby=map(int, input().split())
isprime=[]
def sito(n):
    global isprime
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
    """for i, p in enumerate(isprime):
        if p:
            primes.append(i)
    primes=set(primes)"""

sito(10**6+100)
#print(primes)

def tprime(liczba):
    s=floor(sqrt(liczba))
    #print(s)
    if (isprime[s] or s==2) and s*s==liczba:
        return True
    else: return False

#print(tprime(4))

for liczba in liczby:
    if tprime(liczba): print("YES")
    else: print("NO")
