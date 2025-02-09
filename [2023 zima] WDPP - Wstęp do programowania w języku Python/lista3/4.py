from turtle import *
from math import pi, sin
NSTEPS=100
Screen().setup(1000,1100)
speed(0)
forward(-500)
forward(1000)
forward(-1000)
for i in range(NSTEPS*2):
    v=-pi
    v+=pi/NSTEPS*i
    s=-sin(v)*500
    print(s)
    left(90)
    forward(s)
    right(90)
    forward(500/NSTEPS)
    right(90)
    forward(s)
    left(90)
    #end_fill()
    #forward(10)
    #begin_fill()
exitonclick()