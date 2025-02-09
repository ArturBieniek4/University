def koperta(n):
    return '\n'.join([''.join(["*" if (x==0 or y==0 or x==2*n or y==2*n or x==y or x==2*n-y) else " " for x in range(2*n+1)]) for y in range(2*n+1)])
print(koperta(10))