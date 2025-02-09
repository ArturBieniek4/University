n,a,b=map(int, input().split())
pociag=[x for x in input()]
miejsca=pociag.count(".")
a,b=max(a,b), min(a,b)
cnt=0
for i,c in enumerate(pociag):
    if c=="*": continue
    if i>0 and pociag[i-1]=='A': continue
    elif c==".":
        a-=1
        cnt+=1
        pociag[i]="A"
    if a==0: break
miejsca-=cnt
cnt+=min(b,miejsca)
print(cnt)#
