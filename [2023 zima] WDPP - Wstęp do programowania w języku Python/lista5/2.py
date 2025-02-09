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

for row in range(4):
    for col in range(4):
        for row2 in range(5):
            for col2 in range(5):
                move(-200+col*100+100/5*col2, -200+row*100+100/5*row2)
                fillcolor([random.random() if (row+col)%2==1 else random.random()/3 for i in range(3)])
                square(20)

update()
exitonclick()