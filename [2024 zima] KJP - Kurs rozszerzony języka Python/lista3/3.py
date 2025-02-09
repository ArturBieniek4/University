from math import sqrt, floor, log

def isprime(n):
    d=2
    while d*d<=n:
        if n%d==0: return False
        d+=1
    return True

def pierwsze(n):
    return [i for i in range(2, n+1) if isprime(i)]

def rozklad(n):
    rozklad=[]
    d=2
    while d*d<=n:
        while n>1 and n%d==0:
            rozklad.append(d)
            n/=d
        if n<=1: return rozklad
        d+=1
    if n>1: rozklad.append((int(n), 1))
    return rozklad

def rozklad_imperatywna(n):
    rozklad=[]
    d=2
    while d*d<=n:
        cnt=0
        while n>1 and n%d==0:
            cnt+=1
            n/=d
        if cnt!=0: rozklad.append((d, cnt))
        if n<=1: return rozklad
        d+=1
    if n>1: rozklad.append((int(n), 1))
    return rozklad

def rozklad_skladana(n):
    # return [(p, floor(log(n, p))*(lambda:n:=n/2)()) for p in range(2, floor(sqrt(n))+1) if n%p==0]
    pass

def rozklad_funkcyjna(n):
    pass

print(rozklad_imperatywna(756))
print(rozklad_skladana(20))
print(rozklad_funkcyjna(20))