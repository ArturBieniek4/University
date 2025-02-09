from itertools import product

def check(table, H, V):
    for i, row in enumerate(table):
        if sum(row) != H[i]:
            return False
    for j in range(len(V)):
        if sum(table[i][j] for i in range(len(H))) != V[j]:
            return False
    return True

def solve(V, H):
    m = len(H)
    n = len(V)
    for table in product([0, 1], repeat=m*n):
        table = [list(table[i:i+n]) for i in range(0, m*n, n)]
        if check(table, H, V):
            yield table

def wyswietl_rozwiazanie(table):
    for row in table:
        print(' '.join('█' if cell else ' ' for cell in row))
    print("-------")

for sol in solve([2, 1, 3, 1], [1, 3, 1, 2]):
    wyswietl_rozwiazanie(sol)