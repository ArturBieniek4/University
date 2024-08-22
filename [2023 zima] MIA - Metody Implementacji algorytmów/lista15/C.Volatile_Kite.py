from math import sqrt

polygon=[]
n=int(input())
for vert in range(n):
    x,y=map(int, input().split())
    polygon.append((x,y))
mindist=99999999999999999
for v1 in range(n):
    v2=v1+1
    v3=v2+1
    v2=v2%n
    v3=v3%n
    p1=polygon[v1]
    p2=polygon[v2]
    p3=polygon[v3]
    x0=p2[0]
    y0=p2[1]
    x1=p1[0]
    y1=p1[1]
    x2=p3[0]
    y2=p3[1]
    dist=abs((x2-x1)*(y1-y0)-(x1-x0)*(y2-y1))/sqrt((x2-x1)**2+(y2-y1)**2)
    mindist=min(dist,mindist)
print(mindist/2)
