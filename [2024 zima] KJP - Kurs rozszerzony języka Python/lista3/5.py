from itertools import product

def check(l1, l2, l3, op):
    if op=="+":
        return l1+l2==l3
    if op=="-":
        return l1-l2==l3
    if op=="*":
        return l1*l2==l3
    if op=="/":
        return l1/l2==l3
    return False

def solve(s1, s2, s3, op):
    letters=dict.fromkeys(list(s1+s2+s3))
    for sol in product(list(range(10)), repeat=len(letters)):
        for i, k in enumerate(letters.keys()):
            letters[k]=sol[i]
        l1=''.join([str(letters[k]) for k in s1])
        l2=''.join([str(letters[k]) for k in s2])
        l3=''.join([str(letters[k]) for k in s3])
        if(check(int(l1), int(l2), int(l3), op)): yield letters, l1, l2, l3

def wyswietl_rozwiazanie(rozw):
    rozw, l1, l2, l3 = rozw
    for k in rozw:
        print(k, "=", rozw[k], end=" ", sep="")
    print()
    print(l1, l2, l3, sep="\n")
    print("-"*20)

for sol in solve("KIOTO", "OSAKA", "TOKIO", "+"):
    wyswietl_rozwiazanie(sol)