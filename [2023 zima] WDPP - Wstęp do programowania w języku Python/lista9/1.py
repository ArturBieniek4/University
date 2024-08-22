from turtle import *

TSCALE=800

def trojkat(depth, x, y):
    SCALE=TSCALE*2**(-depth)
    if depth>7: return
    if depth%2==0: fillcolor([1,1,1])
    else: fillcolor([0,0,0])
    goto(x, y)
    begin_fill()
    goto(x+SCALE, y)
    goto(x+SCALE/2, y+SCALE*3**(1/2)/2)
    end_fill()
    if depth%2==1: fillcolor([1,1,1])
    else: fillcolor([0,0,0])
    goto(x+SCALE/4, y+SCALE*3**(1/2)/4)
    begin_fill()
    goto(x+SCALE*3/4, y+SCALE*3**(1/2)/4)
    goto(x+SCALE/2, y)
    end_fill()
    trojkat(depth+1, x+SCALE/4, y+SCALE*3**(1/2)/4)
    trojkat(depth+1, x, y)
    trojkat(depth+1, x+SCALE/2, y)

tracer(0,0)

penup()
trojkat(0, 0, 0)

update()
exitonclick()