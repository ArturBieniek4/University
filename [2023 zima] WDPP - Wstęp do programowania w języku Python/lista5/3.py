from cyfry import print_DLC
from turtle import *

import random
tracer(0)
speed('fastest')

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
color=None
tekst=print_DLC(632178).split('\n')
for row in range(len(tekst[0])):
    if row%6==0: color=[random.random() for i in range(3)]
    for col in range(5):
        move(-400+row*25, -col*25)
        fillcolor(color if tekst[col][row]=='#' else [1.0, 1.0, 1.0])
        square(25)

update()
exitonclick()