def usun_duplikaty(L):
    L=[(c, i) for i,c in enumerate(L)]
    L.sort()
    L2=[]
    for i,c in enumerate(L):
        if i==0 or L[i-1][0]!=c[0]:
            L2.append(c)
    L=L2
    L.sort(key=lambda x: x[1])
    return [c[0] for c in L]

print(usun_duplikaty([1,2,3,1,2,3,8,2,2,2,9,9,4]))