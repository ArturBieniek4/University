import random

def randperm(n):
    dowylosowania=set([i for i in range(n)])
    perm=sorted(dowylosowania, key=lambda x: random.random())
    return perm

def randperm2(n):
    wylosowane=set()
    perm=[]
    while len(wylosowane)<n:
        ktora=random.randint(1, n)
        if ktora not in wylosowane:
            wylosowane.add(ktora)
            perm.append(ktora)
    return perm
print(randperm2(10**6))