import random
from decimal import Decimal, getcontext

getcontext().prec=200

def vat_faktura(lista):
    VAT=Decimal(0.23) if (len(lista)>0 and type(lista[0]) is Decimal) else 0.23
    return sum(lista)*VAT

def vat_paragon(lista):
    VAT=Decimal(0.23) if (len(lista)>0 and type(lista[0]) is Decimal) else 0.23
    return sum([VAT*x for x in lista])

while True:
    n=random.randint(2,5)
    zakupy=[random.randint(1, 10000)/100 for i in range(n)]
    res = vat_faktura(zakupy)==vat_paragon(zakupy)
    if(res==False):
        print(zakupy)
        print(res)
        zakupy=[Decimal(x) for x in zakupy]
        print(vat_faktura(zakupy)==vat_paragon(zakupy))
        break