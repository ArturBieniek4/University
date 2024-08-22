######################################
#  anonimizacja.py
######################################

# Cel: "Ala ma 3 koty i 27 kanarków" -> "Ala ma * koty i ** kanarków"


def jest_cyfra(d):
    try:
        int(d)
        return True
    except ValueError:
        return False

    
def jest_cyfra(d):
    return ord('0') <= ord(d) <= ord('9')    
    
    
def jest_cyfra(d):
    return len(d) == 1 and '0' <= d <= '9'        


def anonimizacja(s):
    wynik = ''
    for znak in s:
        if jest_cyfra(znak):
            wynik += '*'
        else:
            wynik += znak
    return wynik
    

def anonimizacja(s):
    wynik = []
    for znak in s:
        if jest_cyfra(znak):
            wynik.append('*')
        else:
            wynik.append(znak)
    return ''.join(wynik)
    
    
    
print (anonimizacja("Ala ma 3 koty i 27 kanarków"))    



######################################
#  dokumentacja.py
######################################

# automatyczna dokumentacja typu np. str

napis = 'To jest pewien napis'

for metoda in dir(napis):
    if 'is' not in metoda:
        continue  # interesują nas tylko metody z 'is'
    try:
        doc = eval('str.' + metoda).__doc__
        print ('METHOD', metoda)
        print (doc)
        print ()
    except:
        pass
        
        


######################################
#  kwadraty2.py
######################################

# Nowe funkcje: begin_fill, end_fill, fillcolor, goto
# Druga wersja: kwadraty rozdzielne, kolor losowany z dużej przestrzeni

from turtle import *
import random

kolory = ['green', 'yellow', 'blue']
kolory += ['light' + k for k in kolory]

def move(x, y):
    pu()
    goto(x, y)
    pd()
    
    
def kwadrat(x,y, bok, kolor):
    move(x, y)
    fillcolor(kolor)
    
    begin_fill()    
    for i in range(4):
        fd(bok)
        rt(90)
        
    end_fill()    

speed('fastest')
    
for n in range(150):
    x = random.randint(-200, 200)    
    y = random.randint(-200, 200) 
    bok = random.randint(40, 80)
    k = [0.5 + 0.5*random.random(), random.random(), 0.3*random.random()]
    kwadrat(x, y, bok, k)
    
input('Koniec')       


######################################
#  kwadraty3.py
######################################

# Nowe funkcje: begin_fill, end_fill, fillcolor, goto
# Trzecia wersja: kwadraty rozdzielne, kolor obliczany

from turtle import *
import random

kolory = ['green', 'yellow', 'blue']
kolory += ['light' + k for k in kolory]

def move(x, y):
    pu()
    goto(x, y)
    pd()
    
    
def kwadrat(x,y, bok, kolor):
    move(x, y)
    fillcolor(kolor)
    
    begin_fill()    
    for i in range(4):
        fd(bok)
        rt(90)
        
    end_fill()    

speed('fastest')
    
for n in range(150):
    x = random.randint(-200, 200)    
    y = random.randint(-200, 200) 
    bok = random.randint(40, 80)
    R = abs(x) / 200
    G = abs(y) / 200
    B = 0.2
    
    k = [R,G,B]
    kwadrat(x, y, bok, k)
    
input('Koniec')       

######################################
#  kwadraty.py
######################################

# Nowe funkcje: begin_fill, end_fill, fillcolor, goto
# Druga wersja: kwadraty rozdzielne, kolor obliczany

from turtle import *
import random

kolory = ['green', 'yellow', 'blue']
kolory += ['light' + k for k in kolory]

def move(x, y):
    pu()
    goto(x, y)
    pd()
    
    
def kwadrat(x,y, bok, kolor):
    move(x, y)
    fillcolor(kolor)
    
    begin_fill()    
    for i in range(4):
        fd(bok)
        rt(90)
        
    end_fill()    

speed('fastest')
    
for n in range(100):
    x = random.randint(-100, 100)    
    y = random.randint(-100, 100) 
    bok = random.randint(20, 40)
    k = random.choice(kolory)
    kwadrat(x, y, bok, k)
    
input('Koniec')       

######################################
#  rozeta.py
######################################

from turtle import *
import random

kolory = ['green', 'lightgreen', 'yellow', 'brown']

def kwadrat(bok):
    for i in range(4):
        fd(bok)
        rt(90)
        
        
def rozeta(N, a, b):
    for i in range(N):
        fd(b)
        kwadrat(a)
        bk(b)
        
        rt(360/N)

speed('fastest')
pensize(3)


for i in range(10):
    pencolor(random.choice(kolory))
    N = random.choice([4,8,16])
    a = random.randint(30, 60)
    b = a + random.randint(20, 50)        
    rt(random.randint(0, 33))
    rozeta(N, a, b)

input('Koniec')        

######################################
#  tablica2d.py
######################################

import random

N = 6

def pisz(t):
    for wiersz in t:
        print (''.join(wiersz))
        
# tab = N * [ N * ['.'] ]   ZŁO!

tab = [ N * ['.'] for i in range(N)]

for n in range(100):
    y = random.randint(0, N-1)
    x = random.randint(0, N-1)
    tab[y][x] = random.choice('abcdefghijk')
    
pisz(tab)
        

