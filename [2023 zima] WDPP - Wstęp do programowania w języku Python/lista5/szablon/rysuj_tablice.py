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
    pass

def generuj_sin():
    tab = np.zeros( (DY, DX) )
    return tab
                   
tab = np.random.rand(DY,DX)


rysuj_tablice(-300, -100, tab)
rysuj_tablice(100, -100, 0.7 * tab)
rysuj_tablice(-300, 300, generuj_sin())

input() 
# do opowiedzenia: 
#       np.random.rand(), x.min(), x.max(), x[:,:]
