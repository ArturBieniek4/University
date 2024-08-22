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

def palindromy(a,b):
    pierwsze=sito(b)
    pali=[]
    for p in pierwsze:
        if p>=a and str(p)==str(p)[::-1]:
            pali.append(p)
    return pali
print(palindromy(13,999999))
