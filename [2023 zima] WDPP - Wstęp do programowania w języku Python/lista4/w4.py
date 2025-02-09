######################################
#  anonimizacja.py
######################################

def anonimizuj(tekst, brzydkie_slowa):
    "ma powstać tekst, w którym brzydkie_slowa zamienione są na gwiazdki"
    wynik = []
    
    for w in tekst.split():
        if w in brzydkie_slowa:
            wynik.append('*' * len(w))
        else:
            wynik.append(w)
    return ' '.join(wynik)
    
print (anonimizuj('Zwierzątka Ali to kot kanarek pies i aligator', {'kot', 'pies', 'niewiadomoco'}))



######################################
#  gradient.py
######################################

# Gradient -- przejście z jednego koloru do drugiego

import random
from turtle import *
import numpy as np

def move(x, y):
    penup()
    goto(x,y)
    pendown()

def kwadrat(x, y, bok, kolor):
    move(x, y)
    begin_fill()
    fillcolor(kolor)
    for i in range(4):
        fd(bok)
        rt(90)
    end_fill()   
  
speed('fastest') 


kolor1 = np.array([1.0, 0.8, 0.2])
kolor2 = np.array([0, 0.3, 1.0])

N = 20
BOK = 35
for i in range(N):
    alfa = i / (N-1)
    kolor = alfa * kolor1 + (1-alfa) * kolor2
    kwadrat(-200 + BOK * i, 0, BOK, kolor)

input()    



######################################
#  koch.py
######################################

# Krzywa Koch (krzywa pani Koch, mylnie nazywana krzywą kocha)
# rekurencja

from turtle import *

speed('fastest')

def koch(dlugosc, glebokosc):
    if glebokosc == 0:
        fd(dlugosc)
    else:
        koch(dlugosc/3, glebokosc-1)
        lt(60)
        koch(dlugosc/3, glebokosc-1)
        rt(120)
        koch(dlugosc/3, glebokosc-1)
        lt(60)
        koch(dlugosc/3, glebokosc-1)
        



for i in range(3):
    koch(350, 4)
    rt(120)
    
input()

######################################
#  operacje_na_plikach.py
######################################

plik = open('popularne_slowa2023.txt')

#print (plik.read()[1000:1200])

#wiersze_pliku = plik.readlines()[:10]

for wiersz in plik:
    wiersz = wiersz.strip()
    
    if 'kura' in wiersz and len(wiersz) > 14:
        print (wiersz)


######################################
#  podwojne_slowa.py
######################################

# znajdywanie słów, takich jak kura-tor, wał-koń
# praca z plikami tekstowymi i zbiorami

polskie_slowa = set(open('popularne_slowa2023.txt').read().split())

for w in polskie_slowa:
    for i in range(4, len(w)-4):
        lewe = w[:i]
        prawe = w[i:]
        if lewe in polskie_slowa and prawe in polskie_slowa:
            print (lewe+'-'+prawe)
            


######################################
#  set_session.py
######################################

# coding: utf-8
{1,2,3} == {3,2,1}
{1,2,3} == {3,2,1} == {1,1,1,1,1,2,2,2,3}
a = {1,2,3}
b = {3,4,5}
a | b
a & b
a - b
a ^ b
a <= b
a <= b | {1,2}
'ala' in a
2 in a
for x in 'alamakota':
    a.add(x)
    
a
list(a)
for e in a:
    print (e)
    
sorted(a)
b |= {100, 1001, 1002, 99}
b
b |= {7,8,9,99,999,9999}
b
sorted(b)
len(b)
zbior_pusty = {}
zbior_pusty & a
zbior_pusty_poprawnie = set()
zbior_pusty_poprawnie & a
zbior_pusty_poprawnie | a
list('adfg')
set('adfg')
set([1,2,3,4,11])



######################################
#  usun_duplikaty.py
######################################

# cel: usun_duplikaty([1,4,2,3,1,2,6,7,7,7,4]) -> [1,4,2,3,6,7] 

def usun_duplikaty(L):
    wynik = []
    for e in L:
        if e not in wynik:
            wynik.append(e)
    return wynik
    
def usun_duplikaty2(L):
    wynik = []
    przetworzone = set()
    for e in L:
        if e not in przetworzone:
            wynik.append(e)
            przetworzone.add(e)            
    return wynik
    
    
print (usun_duplikaty2([1,4,2,3,1,2,6,7,7,7,4,'1']))    

print (len(usun_duplikaty2(list(range(100000)))))

