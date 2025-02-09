from math import floor, ceil
def energia(n):
    e=0
    while n!=1:
        e+=1
        if n % 2 == 0:
            n= n / 2
        else:
            n= 3 * n + 1
    return e

def analiza_collatza(a,b):
    suma_e=0
    med_e=0
    ile_e=b-a+1
    energie=[]
    for liczba in range(a, b+1):
        energie.append(energia(liczba))
        e=energia(liczba)
        suma_e+=e
    energie.sort()
    #print(energie)
    min_e=energie[0]
    max_e=energie[-1]
    med_e=(energie[floor(ile_e/2)]+energie[ceil(ile_e/2)])/2
    return (suma_e/ile_e, med_e, max_e, min_e)
print(analiza_collatza(1, 17))