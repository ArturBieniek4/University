######################################
#  drobiazgi.py
######################################

# coding: utf-8
L = 'Ala ma kota i kanarka'.split()
for e in L:
    print (e)
    
for i in range(len(L)):
    print (i, L[i])
    
enumerate(L)
list(enumerate(L))
for i, e in enumerate(L):
    print (i, e)
    
d = {'a' : 55, 'b' : 77}

list(d.items())

A = [1,2,3,4,5,6]
B = [33,44,55,66]
for a, b in zip(A, B):
    print (a,b)
    
def nasz_enumerate(L):
    return zip(range(len(L)), L)
    
for i, e in nasz_enumerate(L):
    print (i, e)
    


######################################
#  permutacje.py
######################################

# zliczanie losowych permutacji

import random
from collections import defaultdict as dd

def permutuj(N):
    L = list(range(N))
    random.shuffle(L)
    return L
    
def nasz_permutuj(N):
    L = list(range(N))
    for i in range(N):
        a = random.randint(0, len(L)-1)
        b = random.randint(0, len(L)-1)
        L[a], L[b] = L[b], L[a]
    return L
    
    
licznik = dd(int)
M = 100000
    
for r in range(M):
    p = nasz_permutuj(4)
    licznik[tuple(p)] += 1
    
for p,c in licznik.items():
    print (100 * c/M, p)            
    
print ('Min=', min(licznik.values()))
print ('Max=', max(licznik.values()))    

######################################
#  pol_ang2.py
######################################


from collections import defaultdict as dd
import random

pol_ang = dd(list)  # dobrze!

#pusta_lista = []
#pol_ang = dd(lambda:pusta_lista) ZLE

# poniżej różne dobre sposoby otwarcia pliku
#for x in open('pol_ang.txt').readlines():
#for x in open('pol_ang.txt').read().split('\n'):
#for x in list(open('pol_ang.txt')):
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
        if p in pol_ang:
            wynik.append(random.choice(pol_ang[p]))
        else:
            wynik.append('[' + p + ']')
    return wynik        
    
zdanie = 'chłopiec z dziewczyna pójść do kino'.split()

for i in range(10):
    print (' '.join(tlumacz(zdanie)))  

######################################
#  pol_ang.py
######################################

pol_ang = {}

for x in open('pol_ang.txt'):
    x = x.strip()
    L = x.split('=')
    if len(L) != 2:
        continue
        
    pol, ang = L
    pol_ang[pol] = ang

    
def tlumacz(polskie):
    wynik = []
    for p in polskie:
        if p in pol_ang:
            wynik.append(pol_ang[p])
        else:
            wynik.append('[' + p + ']')
    return wynik        
    
zdanie = 'chłopiec z dziewczyna pójść do kino'.split()

print (' '.join(tlumacz(zdanie)))  


####################################
# Program:  wyjatki.py
####################################

import random

# ZeroDivisionError, NameError

for i in range(10):
    a = random.randint(0, 10)
    b = random.randint(0, 10)
    try:
        print (f'{a} / {b} = {a/b}')
    except ZeroDivisionError:
        print (f'Dzielenie przez zero: {a}/{b}')

######################################
#  wykresy.py
######################################



from math import *
from turtle import *

speed('fastest')
    

A, B = -10, 10
N = 200

def tworz_wykres(f, a, b, N):
    g = []
    krok = (b-a)/(N-1)
    for i in range(N):        
        x = a + i * krok
        g.append( (x,f(x)))
    return g
    
SKALA_X = 30
        
def rysuj_wykres(g, skala, kolor):
    pu()
    goto(SKALA_X * g[0][0], skala * g[0][1])
    pd()
    pencolor(kolor)
    pensize(2)
    for x,y in g:
        goto(SKALA_X * x, skala * y)
     
#wykres = tworz_wykres(sin, A, B, 200)

#rysuj_wykres(wykres, 30, 'red')

for wiersz in open('wykresy.txt'):
    L = wiersz.split()  
    if len(L) < 2:
        print ('Za krótki wiersz:', L)
        continue
      
    kolor = L[0]
    reszta_wiersza = ' '.join(L[1:])
    
    czy_rysujemy = True
    try:
        f = lambda x : eval(reszta_wiersza)
        f(7544)
    except NameError:
        print ('Kłopot z wierszem', L)
        czy_rysujemy = False
        
    if czy_rysujemy:
        wykres = tworz_wykres(f, A, B, 100)
        rysuj_wykres(wykres, 80, kolor)
    
input()    


"""
wykresy.txt:
red     0.8 * sin(x)
orange  0.1 * x
green   sin(x) ** 2 + cos(x) ** 3
blue    sin(x) + 0.1 * x


"""
