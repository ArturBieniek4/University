
def sito(m,n):
    isprime=[1]*10000# 0 jest pominięte, trzeba zawsze -1
    i=2
    while i*i<=n:
        if isprime[i-1]:
            #print("ISPRIME[",i,']=1')
            for j in range(i*2, 10000+1, i):
                isprime[j-1]=0
                #print("ISPRIME[",j,']=0')
        i+=1
    primes=[]
    isprime2=[1]*10000
    for i, p in enumerate(isprime):
        if p:
            print("PRIME1", i+1)
            i+=1
            for j in range(i*(n//i), n+1, i):
                if j<m: continue
                print("j=",j)
                isprime2[j-m]=0
    for i,p in enumerate(isprime2):
        if p:
            primes.append(m+i)

    return primes

m=10000000
n=10009999
print(sito(m,n))
