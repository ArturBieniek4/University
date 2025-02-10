# Program usuwający niepotrzebne (czyli rysujące punkty już wcześniej narysowane + współniniowe) elementy z wektorów u.
# Pozwala kilkukrotnie zmniejszyć ilość punktów u
# Użycie: python3 adjust_u.py > konkurs-I-347165-dane.txt

import numpy as np
from nifs3 import NIFS3, oblicz
from math import sqrt

curves=[]
with open("marked.txt") as fin:
    for line in fin:
        line = line.split("[")
        if len(line)<4: continue
        line=[list(map(float, tab[:tab.find(']')].split(','))) for tab in line if "]" in tab]
        x,y,t,u = line

        # Eliminacja zduplikowanych punktów
        new_u = []
        pixels=set()
        a_x, b_x, c_x, d_x = NIFS3(t, x)
        a_y, b_y, c_y, d_y = NIFS3(t, y)
        for u in u:
            x_val = oblicz(u, t, a_x, b_x, c_x, d_x) 
            y_val = oblicz(u, t, a_y, b_y, c_y, d_y)
            if x_val==None or y_val==None: continue
            point=(round(x_val), round(y_val))
            if point not in pixels:
                pixels.add(point)
                new_u.append(u)

        # Eliminacja kolejnych punktów współliniowych - narzędzie do rysowania wykresów i tak te piksele narysuje, wystarczy pierwszy i ostatni na prostej
        inlinepixels=set()
        for px,py in pixels:
            for px2, py2 in pixels:
                if px==px2 and py==py2: continue
                if px>px2: continue
                if px==px2: # Osobny przypadek gdy prosta jest pionowa, bo nie można dzielić przez 0 :)
                    py, py2 = min(py, py2), max(py, py2)
                    for pymid in range(py+1, py2):
                        midpoint = (px, pymid)
                        if midpoint not in pixels: break
                        inlinepixels.add(midpoint)
                else:
                    incline=(py2-py)/(px2-px)
                    midpoint=(px+1, py+incline)
                    while midpoint<(px2, py2):
                        nextmidpoint=(round(midpoint[0]+1), round(midpoint[1]+incline))
                        if midpoint in pixels and nextmidpoint in pixels:
                            inlinepixels.add(midpoint)
                        else: break
                        midpoint=nextmidpoint
        new_u2 = []
        pixels=set()
        for u in new_u:
            x_val = oblicz(u, t, a_x, b_x, c_x, d_x) 
            y_val = oblicz(u, t, a_y, b_y, c_y, d_y)
            if x_val==None or y_val==None: continue
            point=(int(x_val), int(y_val))
            if point not in inlinepixels:
                pixels.add(point)
                new_u2.append(u)

        print("x:=", [float(p) for p in x], end=', ')
        print("y:=", [float(p) for p in y], end=', ')
        print("t:=", [float(p) for p in t], end=', ')
        print("u:=", [float(p) for p in new_u2], end='\r\n\r\n')