q=int(input())
for zestaw in range(q):
    n=int(input())
    liczby=list(map(int, input().split()))
    for dzieciak in range(n):
        ksiazka_pos=liczby[dzieciak]-1
        dni=1
        while ksiazka_pos!=dzieciak:
            ksiazka_pos=liczby[ksiazka_pos]-1
            dni+=1
        print(dni, end=" ")
    print()
