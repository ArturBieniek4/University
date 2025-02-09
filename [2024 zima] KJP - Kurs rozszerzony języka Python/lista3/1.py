from timeit import timeit
from math import sqrt
def isprime(n):
        d=2
        while d*d<=n:
            if n%d==0: return False
            d+=1
        return True
def pierwsze_imperatywna(n):
    
    pierwsze=[]
    for i in range(2, n+1):
        if isprime(i): pierwsze.append(i)
    return pierwsze

def pierwsze_skladana(n):
    return [i for i in range(2, n+1) if 0 not in [i%d for d in range(2, int(sqrt(i))+1)]]

def pierwsze_funkcyjna(n):
    #all() zwraca true jeśli wszystkie są true
    return(list(filter(lambda i: all(i%d!=0 for d in range(2, int(sqrt(i))+1)), range(2, n+1))))

print("n\tskladana\timperatywna\tfunkcyjna")
for n in range(10, 200, 10):
    print(n, end=":\t")
    print(round(timeit(lambda: pierwsze_imperatywna(n), number=1000), 7), end="\t")
    print(round(timeit(lambda: pierwsze_skladana(n), number=1000), 7), end="\t")
    print(round(timeit(lambda: pierwsze_funkcyjna(n), number=1000), 7), end="\n")
print(pierwsze_imperatywna(20))
print(pierwsze_skladana(20))
print(pierwsze_funkcyjna(20))