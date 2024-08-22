sumypodzbiorow=set()
def f1(zbior, depth, selected=None):
    if selected==None: selected=[False for i in range(len(zbior))]
    if depth==len(zbior):
        sumypodzbiorow.add(sum([j if selected[i] else 0 for i,j in enumerate(zbior)]))
        return
    selected[depth]=True
    f1(zbior,depth+1,selected)
    selected[depth]=False
    f1(zbior,depth+1,selected)
f1([1,2,3,100], 0)
print(sumypodzbiorow)