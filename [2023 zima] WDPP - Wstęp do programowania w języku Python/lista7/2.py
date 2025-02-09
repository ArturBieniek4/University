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
pixels=[]
for y,line in enumerate(obraz):
    for x,pixel in enumerate(line):
        pixels.append((x,y,eval(pixel)))
random.shuffle(pixels)  
for pixel in pixels:
    y=pixel[0]
    x=pixel[1]
    pixel=pixel[2]
    goto(-400+x*10,400-y*10)
    fillcolor(pixel)
    square(10)
    update()

exitonclick()