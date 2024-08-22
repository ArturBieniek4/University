n, S = map(int,input().split())
tab = list(map(int,input().split()))
def check(k):
    new_tab=[]
    for i,el in enumerate(tab):
        new_tab.append(el+(i+1)*k)
    new_tab.sort()
    s=S
    k2=k
    for el in new_tab:
        if k2==0:break
        if el>s:
            break
        else:
            s-=el
            k2-=1
        if k2==0:break
    if k2==0:
        return S-s
    else: return -1
l=0
r=n
while l!=r:
    mid=(l+r+1)//2
    if check(mid)!=-1:
        if l==mid:
            break
        l=mid
    else:
        if r==mid:
            break
        r=mid
while check(r)==-1:r-=1
print(r, check(r))
