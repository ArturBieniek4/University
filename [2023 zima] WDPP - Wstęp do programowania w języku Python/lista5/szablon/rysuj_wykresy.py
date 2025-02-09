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
    rysuj_tablice(sx, sy, tab)      


f1 = lambda x, y: 0
f2 = lambda x, y: 0
f3 = lambda x, y: 0
f4 = lambda x, y: 0
f5 = lambda x, y: 0
f6 = lambda x, y: 0

lista_f = [f1,f2,f3,f4,f5,f6]
for i in range(len(lista_f)):
    sx = -400 + 310 * (i % 3)
    sy = -200 + 310 * (i // 3)
    rysuj_wykres(sx, sy, lista_f[i])
    
input()    
    
