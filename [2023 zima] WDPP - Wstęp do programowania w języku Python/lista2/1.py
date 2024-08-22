def szachownica(n, k):
    return ''.join([(((''.join([" "*k if (row+col)%2==0 else "#"*k for col in range(n*2)])+"\n")*k)) for row in range(n*2)])[:-1]
print(szachownica(2,4))