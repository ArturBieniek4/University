# Gradient -- przejście z jednego koloru do drugiego

import random
from turtle import *
import numpy as np

def move(x, y):
    penup()
    goto(x,y)
    pendown()

colors=['red', 'orange', 'green', 'blue']
tracer(0,0)
speed('fastest')
ILE=36
left(90)
for i in range(ILE):
    fillcolor(colors[i%4])
    begin_fill()
    pendown()
    forward(120+i*5)
    right(90)
    forward(10*36/ILE)
    right(90)
    forward(120+i*5)
    right(90)
    forward(10*36/ILE)
    right(90)
    end_fill()
    right(360/ILE)
move(100, 0)
fillcolor("yellow")
begin_fill()
circle(100)
end_fill()
update()
exitonclick()