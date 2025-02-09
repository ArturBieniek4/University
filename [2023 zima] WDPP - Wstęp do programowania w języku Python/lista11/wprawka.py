def bs(L, x):
    l=0
    r=len(L)
    while l<r:
        mid=(l+r)//2
        #print(l,r,mid, L[mid])
        if L[mid]==x:
            l=mid
            r=mid
        elif L[mid]>x:
            r=mid
        else:
            l=mid+1
    return l if l==r else None

def Znajdz(L,x):
    sol=bs(L,x)
    if sol==None or sol>=len(L): return None
    return L[sol]

def Mniejsze(L, x):
    l=bs(L,x)
    if l==None: return sum(L)
    while l>0 and L[l]>=x: l-=1
    return sum(L[:l+1])

def Wieksze(L, x):
    l=bs(L,x)
    if l==None: return sum(L)
    while l<len(L) and L[l]==x: l+=1
    return sum(L[l:])

print(Znajdz([1,3,5,6,8],4))
print(Znajdz([1,2,4,5],2))
print(Mniejsze([1,3,5,6,8], 5))
print(Wieksze([1,3,5,6,8], 5))

print(Znajdz([1],4))