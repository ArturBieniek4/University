podzialy=set()
def f1(zbior, depth, podzial=None):
    if podzial==None: podzial=[0 for i in range(len(zbior))]
    if depth==len(zbior):
        zbiory=[[] for i in range(len(zbior))]
        for i,grupa in enumerate(podzial):
            zbiory[grupa].append(zbior[i])
        zbiory=tuple(sorted([tuple(sorted(grupa)) for grupa in zbiory if len(grupa)>0]))
        podzialy.add(zbiory)
        return
    for i in range(len(zbior)):
        podzial[depth]=i
        f1(zbior,depth+1,podzial)
f1([1,2,3], 0)
podzialy=list(podzialy)
print(podzialy, len(podzialy))