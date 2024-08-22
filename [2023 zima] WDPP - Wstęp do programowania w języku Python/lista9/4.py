######################################
#  zycie.py
######################################

####################################
# Program:  zycie.py
####################################

from kwadrat import kwadrat
from turtle import update, clear
import random
import sys


txt = """
...kkkkkkkkkkkk.......
......................
......................
......................
..nnnn................
..nnnn................
..n...................
......................
.........kkkkkkkkkkk..
......................
......................
......................
......................
.........ppppp........
......................
"""

tab = [[(komorka,5) if komorka!='.' else (".",0) for komorka in wiersz] for wiersz in txt.split()] 

MY = len(tab)
MX = len(tab[0])

def rysuj_plansze(tab):
    clear()
    for y in range(MY):
        for x in range(MX):
            if tab[y][x][0] == '.':
                kwadrat(x,y,'green')
            elif tab[y][x][0] == 'p':
                kwadrat(x, y, 'white')
            elif tab[y][x][0] == 'k':
                kwadrat(x, y, 'black')
            elif tab[y][x][0] == 'n':
                kwadrat(x, y, 'gray')
            else:
                raise Exception("xd")
    update()        





KIERUNKI = [ (1,0), (0,1), (-1, 0), (0, -1)]

# def liczba_sasiadow(x, y):
#     ls = 0  
#     for dx,dy in KIERUNKI:
#         nx = (x+dx) % MX
#         ny = (y+dy) % MY
#         if tab[ny][nx] == '#':
#             ls += 1 
#     return ls

def losuj_sasiada(x,y):
    sasiedzi = [((x+dx), (y+dy)) for dx, dy in KIERUNKI if x+dx<MX and y+dy<MY]
    return random.choice(sasiedzi)
   
# def pusta_plansza():
#     return [ ['.'] * MX for y in range(MY)]
            
# reguły gry w życie:
# jeżeli komórka pełna ma 2 lub 3 sąsiadów przeżywa, wpp ginie
# jeżeli komórka pusta ma 3 sąsiadów, to rodzi się nowa

# historia = set()

while True:
    rysuj_plansze(tab)
    nowe_tab = [[komorka for komorka in wiersz] for wiersz in tab]
    
    for y in range(MY):
        for x in range(MX):
            if tab[y][x][1]!=0:
                komorka=tab[y][x]
                ls = losuj_sasiada(x,y)
                sasiad=tab[ls[1]][ls[0]]
                if sasiad[0]==komorka[0]: pass # nic sie nie dzieje
                elif sasiad[1]==0:
                    nowe_tab[ls[1]][ls[0]]=(komorka[0], komorka[1])
                else:
                    if (komorka[0]=='p' and sasiad[0]=='k') or (komorka[0]=='k' and sasiad[0]=='n') or (komorka[0]=='n' and sasiad[0]=='p'): #wygrana komórki
                        nowe_tab[ls[1]][ls[0]]=(sasiad[0], sasiad[1]-1)
                        nowe_tab[y][x]=(komorka[0], komorka[1]+1)
                    else:
                        nowe_tab[ls[1]][ls[0]]=(sasiad[0], sasiad[1]+1)
                        nowe_tab[y][x]=(komorka[0], komorka[1]-1)
                nowe_tab[ls[1]][ls[0]]=(nowe_tab[ls[1]][ls[0]][0], min(5, nowe_tab[ls[1]][ls[0]][1]))
                nowe_tab[y][x]=(nowe_tab[y][x][0], min(5, nowe_tab[y][x][1]))
                if nowe_tab[y][x][1]==0: nowe_tab[y][x]=('.', 0)
                if nowe_tab[ls[1]][ls[0]][1]==0: nowe_tab[ls[1]][ls[0]]=('.',0)
    # if str(nowe_tab) in historia:
    #     break
    
    # historia.add(str(nowe_tab))
    #if tab == nowe_tab:
    #    break
                
    tab = [[komorka for komorka in wiersz] for wiersz in nowe_tab]
    
               
print ('Koniec')
input()