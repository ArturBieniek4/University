######################################
#  list_session.py
######################################

# coding: utf-8
a = [1,2,3,4,99]
a
a + a
5 * a
5 * [1,2]
a
a[0]
a[4]
a[0] = 111
a
type(a)
a.append(0)
a.append(0)
a.append(0)
a
a.append('ostatni element')
a
a.append([1,2,3])
a
b = list('Alabaster')
b
b[0], b[-1], b[len(b)-1]
b[-10]
b[3:6]
b[3:-1]
b[3:]
b[:3]
b[3:999]
b[5:3]
b[3:6] = ['B', 'A', 'S']
b
b[3:6] = ['B', 'A', 'S', 'S', 'S']
b
str(b)
'--', join(b)
'--'.join(b)
''.join(b)
x = 'Ala ma kota i dwa kanarki'
x[4:11]
x[0]
x[-1]
x[0] = 'O'
y = 'O' + x[1:]
y
len(y)
for i in range(len(b)):
    print (b[i])
    
for element in b:
    print (element, end= ' ')
    
for i in range(len(b)):
    print (b[i])
    i += 2
    
for litera in 'Taki napis':
    print (litera)
    
A = []
B = [A, A, A]
A.append('x')
A.append('y')
B


######################################
#  losowe_spacery.py
######################################

from turtle import goto, fd, rt, lt, speed, pensize, pencolor, pu, pd
import random


kolory = ['green', 'lightgreen', 'yellow', 'orange', 'blue', 'black', 'red']

speed('fastest')

pensize(2)

N = 50

for k in range(10):
    print ('Przebieg', k) # Nieeleganckie -- to samo k
    for k in kolory:
        pencolor(k)
        for i in range(N):
            fd(4)
            rt(random.randint(-25, 25))
        pu()
        goto(0, 0)
        pd()    
        
input('Koniec działania')            



######################################
#  reverse.py
######################################

import time
import random

def rev1(L):
    L = L[:]
    for i in range(len(L) // 2):
        L[i], L[-(i+1)] = L[-(i+1)], L[i] 
    return L
    
def rev2(L):
    res = []
    for i in range(len(L)):
        res.append(L[-(i+1)])
    return res    
    
def rev3(L):
    res = []
    for e in L:
        res = [e] + res
    return res    
    
def rev4(L):
    return L[::-1]  
    
def rev5(L):
    if len(L) <= 1:
        return L
    return [L[-1]] + rev5(L[:-1])      

def test(rev, N):
    x = list(range(N))
    
    t0 = time.time()
    rev(x)
    return time.time() - t0
    

numbers = [1,2,3,4,5,6,7]

    
    
for rev in [rev1, rev2, rev3, rev4]:
    print (rev, test(rev, 100000))
    
    




