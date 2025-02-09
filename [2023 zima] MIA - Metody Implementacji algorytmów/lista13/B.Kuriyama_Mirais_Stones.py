n=int(input())
tab=list(map(int,input().split()))
tabsort=sorted(tab)
pre=[0 for i in range(len(tab))]
presort=[0 for i in range(len(tab))]
for i,l in enumerate(tab):
    if i==0: pre[i]=l
    pre[i]=pre[i-1]+l
for i,l in enumerate(tabsort):
    if i==0: presort[i]=l
    presort[i]=presort[i-1]+l
#print(pre)
#print(presort)
q=int(input())
for zap in range(q):
    t,l,r=map(int,input().split())
    if t==1:
        print(tab[l-1]+pre[r-1]-pre[l-1])
    else:
        print(tabsort[l-1]+presort[r-1]-presort[l-1])
