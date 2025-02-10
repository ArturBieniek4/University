# Program pomocniczy do rysowania krzywych NIFS3 na obrazku.
# PPM dodaje punkt lub usuwa gdy stoi się na punkcie
# R odwraca kolejność punktów
# Rysuje się jedną krzywą na raz
# Wyjście programu jest w formacie z zadania
# Użycie: python3 pointmarker.py >> marked.txt

import matplotlib.pyplot as plt
from nifs3 import NIFS3, oblicz
import numpy as np
from math import sqrt

image_path = "orig_napis.jpg"
M = 600

class ImageMarker:
    def __init__(self, image_path):
        self.image_path = image_path
        self.points = []
        with open("marked.txt") as fin:
            for line in fin:
                line = line.split("[")
                if len(line)<4: continue
                line=[list(map(float, tab[:tab.find(']')].split(','))) for tab in line if "]" in tab]
                x,y,t,u = line
                self.points=list(zip(x,y))

    def draw_nifs(self, points):
        if(len(points)<2): return
        x,y = [x for x,y in points], [y for x,y in points]
        t_dists=[0 for i in range(len(x))]
        t_distsum=0
        for i in range(1,len(x)):
            dist = sqrt((x[i]-x[i-1])**2+(y[i]-y[i-1])**2)
            t_dists[i]=t_dists[i-1]+dist
            t_distsum+=dist
        t = [t_dists[i]/t_distsum for i in range(len(x))]

        u_values = np.linspace(0, 1, M)

        a_x, b_x, c_x, d_x = NIFS3(t, x)
        a_y, b_y, c_y, d_y = NIFS3(t, y)

        sx_vals = [oblicz(u, t, a_x, b_x, c_x, d_x) for u in u_values]
        sy_vals = [oblicz(u, t, a_y, b_y, c_y, d_y) for u in u_values]
        plt.plot(sx_vals, sy_vals, linewidth=1, color='blue')

    def onclick(self, event):
        if event.button is plt.MouseButton.RIGHT and event.xdata is not None and event.ydata is not None:
            x, y = event.xdata, event.ydata
            
            for point in self.points:
                if abs(point[0] - x) < 1 and abs(point[1] - y) < 1: 
                    self.points.remove(point)
                    self.redraw_points()
                    return

            self.points.append((x, y))
            self.redraw_points()

    def onpress(self, event):
        if event.key=='r':
            self.points=self.points[::-1]
            self.redraw_points()

    def redraw_points(self):
        self.fig.canvas.toolbar.push_current()
        plt.cla()
        self.fig.canvas.toolbar.back()
        img = plt.imread(self.image_path)
        plt.imshow(img)
        plt.title('NIFS3 point marker')
        for i,point in enumerate(self.points):
            plt.scatter(point[0], point[1], color='red', s=10)
            plt.text(point[0], point[1], str(i), fontsize=9)
        self.draw_nifs(self.points)
        plt.draw()

    def mark_points(self):
        img = plt.imread(self.image_path)
        self.fig, self.ax = plt.subplots()
        self.ax.imshow(img)
        self.ax.set_title('PPM = dodanie/usunięcie punktu, R = odwrócenie kolejności punktów')

        cid = self.fig.canvas.mpl_connect('button_press_event', self.onclick)
        self.fig.canvas.mpl_connect('key_press_event', self.onpress)
        plt.show()
        self.fig.canvas.mpl_disconnect(cid)

    def export_points(self):
        x = [p[0] for p in self.points]
        y = [p[1] for p in self.points]
        t_dists=[0 for i in range(len(x))]
        t_distsum=0
        for i in range(1,len(x)):
            dist = sqrt((x[i]-x[i-1])**2+(y[i]-y[i-1])**2)
            t_dists[i]=t_dists[i-1]+dist
            t_distsum+=dist
        t = [t_dists[i]/t_distsum for i in range(len(x))]
        u = np.linspace(0, 1, M)
        print("x:=", [float(p) for p in x], end=', ')
        print("y:=", [float(p) for p in y], end=', ')
        print("t:=", [float(p) for p in t], end=', ')
        print("u:=", [float(p) for p in u], end='\r\n\r\n')

marker = ImageMarker(image_path)
marker.mark_points()
marker.export_points()
