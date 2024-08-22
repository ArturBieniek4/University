import random
imiona=open('imiona.txt').read().split()
kontynuacje={}
for imie in imiona:
    imie="^^"+imie.strip()+"$"
    for start in range(len(imie)-2):
        dwaznaki=imie[start:start+2]
        trzeci=imie[start+2]
        #print(dwaznaki,trzeci)
        if dwaznaki not in kontynuacje: kontynuacje[dwaznaki]={}
        if trzeci not in kontynuacje[dwaznaki]: kontynuacje[dwaznaki][trzeci]=1
        else: kontynuacje[dwaznaki][trzeci]+=1
#print(kontynuacje)
mindlugosc=4+3
maxdlugosc=10+3
#print(kontynuacje["TR"])
for i in range(10):
    slowo="^^"
    while len(slowo)<maxdlugosc and slowo[-1]!="$" or len(slowo)<mindlugosc:
        #print(slowo)
        if slowo[-1]=="$" and len(slowo)<mindlugosc or len(slowo)>maxdlugosc or slowo[-2:] not in kontynuacje:
            slowo="^^"
            continue
        kont=random.choices(list(kontynuacje[slowo[-2:]].keys()), weights=kontynuacje[slowo[-2:]].values(), k=1)[0]
        slowo+=kont
    print(slowo[2:-1])
    