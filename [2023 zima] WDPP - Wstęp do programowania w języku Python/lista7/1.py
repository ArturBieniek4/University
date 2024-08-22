from turtle import *
import random

def square(size):
    begin_fill()
    for i in range(4):
        fd(size)
        rt(90)
    end_fill()

tracer(0,1)
speed('fastest')
colormode(255)
with open("obraz.txt") as f:
    obraz=[line.split() for line in f]
penup()
for y,line in enumerate(obraz):
    for x,pixel in enumerate(line):
        goto(-400+y*10,400-x*10)
        fillcolor(eval(pixel))
        square(10)

update()
exitonclick()