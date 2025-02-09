from turtle import *
import random
from math import floor

mapa = [[0 for i in range(100)] for i in range(100)]
for i in range(random.randint(2,6)):
    mapa[random.randint(0,99)][random.randint(0,99)]=random.randint(950, 1000)/1000

for i in range(500000):
    y=random.randint(1,98)
    x=random.randint(1,98)
    suma=0
    sumawag=1
    mnoznik=30
    sumawag+=mnoznik*mapa[y][x]
    sumawag+=mnoznik*mapa[y-1][x]
    sumawag+=mnoznik*mapa[y+1][x]
    sumawag+=mnoznik*mapa[y][x-1]
    sumawag+=mnoznik*mapa[y][x+1]
    sumawag+=mnoznik*mapa[y-1][x-1]
    sumawag+=mnoznik*mapa[y-1][x+1]
    sumawag+=mnoznik*mapa[y+1][x-1]
    sumawag+=mnoznik*mapa[y+1][x+1]
    suma+=mapa[y][x]*(mnoznik*mapa[y][x])
    suma+=mapa[y-1][x]*(mnoznik*mapa[y-1][x])
    suma+=mapa[y+1][x]*(mnoznik*mapa[y+1][x])
    suma+=mapa[y][x-1]*(mnoznik*mapa[y][x-1])
    suma+=mapa[y][x+1]*(mnoznik*mapa[y][x+1])
    suma+=mapa[y-1][x-1]*(mnoznik*mapa[y-1][x-1])
    suma+=mapa[y-1][x+1]*(mnoznik*mapa[y-1][x+1])
    suma+=mapa[y+1][x-1]*(mnoznik*mapa[y+1][x-1])
    suma+=mapa[y+1][x+1]*(mnoznik*mapa[y+1][x+1])
    #print("mapa[", y, "][", x, "]=", suma/8,sep="")
    mapa[y][x]=max(mapa[y][x],suma/sumawag)


kolory = ["green", (0.5, 1, 0) , "yellow", "orange", "red", (0.5, 0,0) ]

def square(size):
    begin_fill()
    for i in range(4):
        fd(size)
        rt(90)
    end_fill()

tracer(0,0)
penup()
for y in range(100):
    for x in range(100):
        goto(-400+x*5,400-y*5)
        ikolor=int(mapa[y][x]*(len(kolory)-1))
        fillcolor(kolory[ikolor])
        square(5)
    update()

update()
exitonclick()