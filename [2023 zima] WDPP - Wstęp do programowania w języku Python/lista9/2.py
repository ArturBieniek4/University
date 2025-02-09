import random
from collections import defaultdict as dd

def wystapienia(s):
    wyst={}
    for c in s:
        if c in wyst:
            wyst[c]+=1
        else: wyst[c]=1
    return wyst

def ukladalne(dest, src):
    dest=wystapienia(dest)
    src=wystapienia(src)
    for c in dest:
        if c not in src or src[c]<dest[c]:
            return False
    return True

#slowa=random.sample(open("popularne_slowa2023.txt").read().split(), 50000)
slowa=(open("popularne_slowa2023.txt").read().split())
slowasort=set()
przywrocslowa={}
for slowo in slowa:
    sortslowo=''.join(sorted(slowo))
    slowasort.add(sortslowo)
    przywrocslowa[sortslowo]=slowo
def gen(osoba):
    slowa2=[]
    osoba=osoba.lower()
    osoba=osoba.replace(' ', '')
    l=len(osoba)
    znalezione=set()
    for i1,slowo1 in enumerate(slowa):
        l1=len(slowo1)
        if l1>l: continue
        if not ukladalne(slowo1, osoba): continue
        slowa2.append(slowo1)
        brakuje=wystapienia(osoba)
        for litera in slowo1:
            brakuje[litera]-=1
        slowobrakujace=""
        for key in brakuje:
            while brakuje[key]>0:
                brakuje[key]-=1
                slowobrakujace+=key
        slowobrakujace = ''.join(sorted(list(slowobrakujace)))
        #if slowobrakujace in slowasort: znalezione.add((slowo1+" "+przywrocslowa[slowobrakujace]))
        for slowo2 in slowa2:
            if not ukladalne(slowo2, slowobrakujace): continue
            brakuje=wystapienia(slowobrakujace)
            for litera in slowo2:
                brakuje[litera]-=1
            slowobrakujace2=""
            for key in brakuje:
                while brakuje[key]>0:
                    brakuje[key]-=1
                    slowobrakujace2+=key
            slowobrakujace2=''.join(sorted(list(slowobrakujace2)))
            if slowobrakujace2 in slowasort: znalezione.add(slowo1+" "+slowo2+" "+przywrocslowa[slowobrakujace2])
    print(znalezione)
    znalezione2=set()
    dupli=[]
    for slowo in znalezione:
        if slowo==osoba or slowo in dupli or sorted(slowo.split()[::-1]) in dupli: continue
        znalezione2.add(slowo)
        dupli.append(sorted(slowo.split()[::-1]))
    return znalezione2

for slowa in gen("Józef Stalin"):
    print(slowa)