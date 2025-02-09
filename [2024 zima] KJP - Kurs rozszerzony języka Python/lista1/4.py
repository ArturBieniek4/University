import random
from math import sqrt, pi
cltwt=100000000
ltwo=0
for i in range(cltwt):
    x=random.random()
    y=random.random()
    if sqrt(x**2+y**2)<=1:
        ltwo+=1
print(4*ltwo/cltwt)