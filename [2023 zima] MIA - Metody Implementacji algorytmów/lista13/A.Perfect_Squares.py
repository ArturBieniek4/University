from math import sqrt
n=int(input())
tab=list(map(int,input().split()))
tab.sort(reverse=True)
for liczba in tab:
    if liczba<0:
        print(liczba)
        break
    if liczba==0: continue
    sq=sqrt(liczba)
    if sq//1!=sq:
        print(liczba)
        break
