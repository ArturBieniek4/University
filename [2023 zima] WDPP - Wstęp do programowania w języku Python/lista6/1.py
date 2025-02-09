from duze_cyfry import daj_cyfre
from turtle import *
import random
from copy import deepcopy

ROZMIAR=30
ILECYFR=20

matryca=[[[1,1,1] for x in range(ROZMIAR)] for y in range(ROZMIAR)]

print(daj_cyfre(3))

def move(x,y):
    penup()
    goto(x,y)
    pendown()

def square(size):
    begin_fill()
    for i in range(4):
        fd(size)
        rt(90)
    end_fill()

tracer(0)
speed('fastest')
kolory=['yellow', 'cyan', 'red', 'orange', 'pink', 'purple', 'green']
cyfry=0

def sprobujwstawic(matryca, dowstawienia, pozycja_x, pozycja_y, kolor):
    matryca2=deepcopy(matryca)
    for y in range(5):
        for x in range(5):
            if pozycja_y+y>0 and matryca[pozycja_y+y-1][pozycja_x+x]==kolor: return False
            if pozycja_y+y<4 and matryca[pozycja_y+y+1][pozycja_x+x]==kolor: return False
            if pozycja_x+x>0 and matryca[pozycja_y+y][pozycja_x+x-1]==kolor: return False
            if pozycja_x+x<4 and matryca[pozycja_y+y][pozycja_x+x+1]==kolor: return False
            if dowstawienia[y][x]=='#':
                if matryca[pozycja_y+y][pozycja_x+x]!=[1,1,1]: return False
                matryca2[pozycja_y+y][pozycja_x+x]=kolor
    return matryca2

while cyfry<ILECYFR:
    kolor=random.choice(kolory)
    pozycja_y=random.randint(0, 25)
    pozycja_x=random.randint(0, 25)
    dowstawienia=daj_cyfre(random.randint(1,9))
    wstawione=sprobujwstawic(deepcopy(matryca), dowstawienia, pozycja_x, pozycja_y, kolor)
    if wstawione!=False:
        matryca=wstawione
        cyfry+=1

for y in range(ROZMIAR):
    for x in range(ROZMIAR):
        move(-400+x*20, 400-y*20)
        fillcolor(matryca[y][x])
        square(20)
update()
exitonclick()