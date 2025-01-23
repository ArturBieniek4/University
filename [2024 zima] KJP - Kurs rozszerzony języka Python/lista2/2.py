memo={}
USE_MEMO=True
def sudan(n,x,y):
    if(n==0): return x+y
    if(y==0): return x
    if USE_MEMO and (n,x,y) in memo: return memo[(n,x,y)]
    next=sudan(n, x, y-1)
    memo[(n, x, y)]=sudan(n-1, next, next+y)
    return memo[(n, x, y)]
print(sudan(2, 4, 2))
# Z eksperymentów wynika, że nie ma zbytnio znaczenia, czy używa się spamiętywania, ponieważ mamy problem ze zbyt głęboką rekursją, a nie z wydajnością samych obliczeń