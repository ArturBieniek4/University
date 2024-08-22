######################################
#  najdluzsze_slowa.py
######################################

slowa_z_lalki = set(open('lalka-tom-pierwszy.txt').read().split())

litery = set('aąbcćdeęfghijklłmnńoópqrsśtuwxyzźż')

dobre_slowa = [s for s in slowa_z_lalki if set(s) <= litery]

K = 10

#for s in sorted(dobre_slowa, key=len)[-K:]:
for s in sorted(dobre_slowa, key=len, reverse=True)[:K]:
#for s in sorted(dobre_slowa, key=lambda x:-len(x))[:K]:
    print (s)        


######################################
#  najdluzsze_slowo2.py
######################################

slowa_z_lalki = set(open('lalka-tom-pierwszy.txt').read().split())

litery = set('aąbcćdeęfghijklłmnńoópqrsśtuwxyzźż')

dobre_slowa = [s for s in slowa_z_lalki if set(s) <= litery]

        
print('Najdluzsze slowo to', max(dobre_slowa, key=len))

######################################
#  najdluzsze_slowo.py
######################################

slowa_z_lalki = set(open('lalka-tom-pierwszy.txt').read().split())

litery = set('aąbcćdeęfghijklłmnńoópqrsśtuwxyzźż')

dobre_slowa = [s for s in slowa_z_lalki if set(s) <= litery]
max_len = 0
kandydat = ''

for s in dobre_slowa:
    if len(s) > max_len:
        max_len = len(s)
        kandydat = s
        
print('Najdluzsze slowo to', kandydat)

######################################
#  posortuj.py
######################################

# sortowanie przez wstawianie. funkcja_klucza


def wstaw(L, e, funkcja_klucza):
    for i in range(len(L)):
        if funkcja_klucza(e) < funkcja_klucza(L[i]):
            return L[:i] + [e] +  L[i:]
    return L + [e] 


def posortowana(L, funkcja_klucza):
    wynik = []
    for e in L:
        wynik = wstaw(wynik, e, funkcja_klucza)
        
    return wynik    
    
def qsort(L):
    if len(L) <= 1:
        return L
    x = L[0]
    return (
        qsort( [e for e in L[1:] if e <= x]) +
        [x] +
        qsort( [e for e in L[1:] if e > x])
    )    
    
def przeciwna(n):
    return -n
        
L = [5,4,3,2,1,8,9,10,0]

def identycznosc(n):
    return n

slowa = 'Ala ma 2 koty i 777 kanarków i to tyle'.split()

"""
print (posortowana(L, identycznosc))  
print (posortowana(slowa, identycznosc))
print (posortowana(slowa, len))
print (posortowana(L, przeciwna))  
print (posortowana(L, lambda x: -x))
"""

print (qsort(L))



######################################
#  rysuj_tablice.py
######################################

from turtle import *
import numpy as np
from math import sin, cos

tracer(0,1)

def move(x, y):
    pu()
    goto(x, y)
    pd()
    
def kwadrat(bok, kolor):
    fillcolor(kolor)
    begin_fill()
    for i in range(4):
        fd(bok)
        rt(90)
    end_fill()

kolor_jasny = np.array( [1,0.5,0.5] )
kolor_jasny = np.array( [1,1,0] )
    
DX = DY = 15
BOK = 20

def rysuj_tablice(sx, sy, tab):
    for y in range(DY):
        for x in range(DX):
            move(sx + x*BOK, sy + y*BOK)
            kwadrat(BOK, tab[y, x] * kolor_jasny)
            
            
def generuj_sin():
    tab = np.zeros( (DY, DX) )
    for y in range(DY):
        for x in range(DX):
            tab[y,x] = sin(0.5 * x) + 1.2*cos(0.8*y)
    
    tab -= tab.min() 
    tab /= tab.max()       
    return tab
                   
tab = np.random.rand(DY,DX)


rysuj_tablice(-300, -100, tab)
rysuj_tablice(100, -100, 0.4 * tab)
rysuj_tablice(-300, 300, generuj_sin())

input() 
# do opowiedzenia: 
#       np.random.rand(), x.min(), x.max(), x[:,:]

######################################
#  rysuj_wykresy.py
######################################

from turtle import *
import numpy as np
from math import sin, cos

tracer(0,1)

def move(x, y):
    pu()
    goto(x, y)
    pd()
    
def kwadrat(bok, kolor):
    fillcolor(kolor)
    begin_fill()
    for i in range(4):
        fd(bok)
        rt(90)
    end_fill()

kolor_jasny = np.array( [1,1,0.5] )
    
DX = DY = 15
BOK = 20

def rysuj_tablice(sx, sy, tab):
    for y in range(DY):
        for x in range(DX):
            move(sx + x*BOK, sy + y*BOK)
            kwadrat(BOK, kolor_jasny * tab[y,x])

def rysuj_wykres(sx, sy, f):
    tab = np.zeros( (DY, DX) )
    for y in range(DY):
        for x in range(DX):
            tab[y, x] = f(x, y)
    minimum = tab.min()
    tab -= minimum  
    tab /= tab.max()
    
    tab[10,:] *= 0.6
    tab[2:5, 2:5] = 0.8
    
    rysuj_tablice(sx, sy, tab)      


f1 = lambda x, y: x+2*y
f2 = lambda x, y: sin(0.02*x*x) + cos(0.1*x)
f3 = lambda x, y: -(x-DX/2) ** 2 - (y-DY/2) ** 2
f4 = lambda x, y: x*x
f5 = lambda x, y: x+y if x > y else 10
f6 = lambda x, y: x - y ** 2

lista_f = [f1,f2,f3,f4,f5,f6]

for i in range(len(lista_f)):
    sx = -400 + 310 * (i % 3)
    sy = -200 + 310 * (i // 3)
    rysuj_wykres(sx, sy, lista_f[i])
    
input()    
    

