def Trec(n,m):
    #print("(",n,", ",m,")", sep="")
    if m==0: return n
    if n==0: return m
    return Trec(n-1, m)+2*Trec(n, m-1)

def Titer(n,m):
    tab=[i for i in range(max(n,m)+2)]
    for i in range(1,n+1):#dla każdej kol za wyjątkiem pierwszej
        tab[0]=i
        for j in range(1,m+1):#dla każdego wiersza za wyjątkiem pierwszego
            #print('i=',i,'j=',j,'tab[',j,']=',tab[j],'+2*',tab[j-1],'=',tab[j]+tab[j-1]*2)
            tab[j]+=tab[j-1]*2
    return tab[m]

#print(Titer(4,3))
for n in range(3+1):
    for m in range(4+1):
        print(n,m,Titer(n,m)==Trec(n,m))