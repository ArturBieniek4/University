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

STEP = 20
LOOPS = 19
STARTCOLOR = (230/255, 242/255, 33/255)
ENDCOLOR = (230/255, 38/255, 156/255)

colordiff=tuple(ENDCOLOR[i]-STARTCOLOR[i] for i in range(3))
colorstep=tuple(colordiff[i]/(LOOPS*LOOPS/2) for i in range(3))
actcolor=STARTCOLOR
print(colordiff, colorstep)
speed('fastest')
x=0
y=0
color=STARTCOLOR
for dl in range(LOOPS):
    for i in range(dl):
        kwadrat(x,y,STEP,actcolor)
        if dl%4==1: x+=STEP
        elif dl%4==2: y-=STEP
        elif dl%4==3: x-=STEP
        elif dl%4==0: y+=STEP
        actcolor=tuple(actcolor[i]+colorstep[i] for i in range(3))
        print(actcolor)
exitonclick()