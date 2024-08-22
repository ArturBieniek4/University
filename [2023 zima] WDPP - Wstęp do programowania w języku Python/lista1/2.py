from math import log
def silnia(n):
    if(n==1): return n
    else: return n*silnia(n-1)
for i in range(4,101):
    sil=silnia(i)
    #l=len(str(sil))
    l=int(log(sil, 10)//1+1)
    print(i, "! ma ", l, " cyfr", "y" if l//10%10!=1 and l%10>1 and l%10<5 else "", sep="")