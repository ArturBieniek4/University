from collections import defaultdict as dd
import random

pol_ang = dd(list)  # dobrze!

#pusta_lista = []
#pol_ang = dd(lambda:pusta_lista) ZLE

# poniżej różne dobre sposoby otwarcia pliku
#for x in open('pol_ang.txt').readlines():
#for x in open('pol_ang.txt').read().split('\n'):
#for x in list(open('pol_ang.txt')):

brown=open('brown.txt').read().split()
brownpop=dd(lambda: 0)
for word in brown:
    brownpop[word.lower()]+=1

for x in open('pol_ang.txt'):
    x = x.strip()
    L = x.split('=')
    if len(L) != 2:
        continue
        
    pol, ang = L
    pol_ang[pol].append(ang)
def tlumacz(polskie):
    wynik = []
    for p in polskie:
        p=p.lower()
        if p in pol_ang:
            wynik.append(sorted(pol_ang[p], reverse=True, key=lambda ang:(brownpop[ang], random.random()))[0])
        else:
            wynik.append('[' + p + ']')
    return wynik        
    
zdanie = 'komputer zrobić śniadanie'.split()

for i in range(10):
    print (' '.join(tlumacz(zdanie))) 