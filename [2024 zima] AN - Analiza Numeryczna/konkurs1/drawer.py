# Program rysujący wyjściowy obrazek i zapisujący go jako .jpg
# Użycie: python3 drawer.py

import numpy as np
import matplotlib.pyplot as plt
from math import sqrt
from nifs3 import NIFS3, oblicz

# Specyfikacja wyjściowego obrazu
height = float(382)
width = float(918)
color='#bc5d71'

# Config plt do exportu 1:1 jpega
fig = plt.figure()
fig.set_size_inches(width/height, 1, forward=False)
ax = plt.Axes(fig, [0., 0., 1., 1.])
ax.set_axis_off()
fig.add_axes(ax)
plt.xlim(0, width)
plt.ylim(height, 0)
plt.gca().set_aspect('equal')

curves=[]
with open("konkurs-I-347165-dane.txt") as fin:
    for line in fin:
        line = line.split("[")
        if len(line)<4: continue
        line=[list(map(float, tab[:tab.find(']')].split(','))) for tab in line if "]" in tab]
        x,y,t,u = line

        a_x, b_x, c_x, d_x = NIFS3(t, x)
        a_y, b_y, c_y, d_y = NIFS3(t, y)

        sx_vals = [oblicz(uv, t, a_x, b_x, c_x, d_x) for uv in u]
        sy_vals = [oblicz(uv, t, a_y, b_y, c_y, d_y) for uv in u]
        plt.plot(sx_vals, sy_vals, linewidth=0.5, color=color)
plt.savefig("konkurs-I-347165.jpg", dpi = height, format="jpeg", pil_kwargs={"quality": 100}) 
plt.show()