from turtle import *
import random

def kwadrat(bok):
    begin_fill()
    for i in range(4):
      fd(bok)
      rt(90)
    end_fill()
    
kolory=['black', 'red', 'orange', 'blue']
ikolor=0
def murek(s,bok):
  global ikolor
  for a in s:
     if a == 'f':
         kwadrat(bok)
         fd(bok)
     elif a == 'b':
         kwadrat(bok)
         fd(bok)         
     elif a == 'l':
         bk(bok)
         lt(90)
     elif a == 'r':
        rt(90)
        fd(bok)
     elif a=='c':
        ikolor=(ikolor+1)%len(kolory)
        fillcolor(kolory[ikolor])


        
color('black', 'yellow')

ht()

def kwadracik():
    napis=""
    for i in range(4):
        for i in range(5):
            napis+="fc"
        napis+="r"
    murek(napis,20)  

def spirala(LOOPS):
    napis=""
    for dl in range(LOOPS):
        for i in range(dl):
            napis+='fc'
        napis+='r'
    murek(napis, 20)
tracer(0,0) # szybkie rysowanie   
penup()    
#murek(4 * 'fffffr', 14)    
kwadracik()
goto(200,200)
spirala(18)
update() # uaktualnienie rysunku

input()