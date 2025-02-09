n=4
uzytoliczbe=[False for i in range(1,n**2+2)]
sumawiersz=[0 for i in range(n)]
sumakol=[0 for i in range(n)]
sumaprzek1=0
sumaprzek2=0
tab=[[None for i in range(n)] for i in range(n)]
rozw=None
def kwadrat(w,k):
    #print(w,k)
    global uzytoliczbe, sumawiersz, sumakol, sumaprzek1, sumaprzek2, tab, rozw
    suma=sumakol[1]
    # if sumaprzek2!=suma: return
    for kol in sumakol:
        if kol!=suma: return
    # for wie in sumawiersz:
    #     if wie!=suma: return
    # if rozw!=None: return
    if w>=n:
        #print('xd')
        rozw=[[el for el in wiersz] for wiersz in tab]
        print(rozw)
        return
    #print(w,k)
    for i in range(1,n**2+1):
        if not uzytoliczbe[i]:
            uzytoliczbe[i]=True
            tab[w][k]=i
            sumawiersz[w]+=i
            sumakol[k]+=i
            if w==k:sumaprzek1+=i
            if n-1-k==w: sumaprzek2+=i
            if k==n-1:
                kwadrat(w+1,0)
            else: kwadrat(w,k+1)
            uzytoliczbe[i]=False
            tab[w][k]=None
            sumawiersz[w]-=i
            sumakol[k]-=i
            if w==k:sumaprzek1-=i
            if n-1-k==w: sumaprzek2-=i
kwadrat(0,0)
print(rozw)