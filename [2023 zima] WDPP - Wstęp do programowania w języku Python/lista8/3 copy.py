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
total_words=len(slowa)
def gen(osoba):
    osoba=osoba.lower()
    osoba=osoba.replace(' ', '')
    l=len(osoba)
    znalezione=set()
    for i1,slowo1 in enumerate(slowa):
        l1=len(slowo1)
        if l1>l: continue
        if not ukladalne(slowo1, osoba): continue
        brakuje=wystapienia(osoba)
        for litera in slowo1:
            brakuje[litera]-=1
        slowobrakujace=""
        for key in brakuje:
            while brakuje[key]>0:
                brakuje[key]-=1
                slowobrakujace+=key
        slowobrakujace = ''.join(sorted(list(slowobrakujace)))
        #print(slowo1, slowobrakujace, slowobrakujace in slowasort)
        if slowobrakujace in slowasort: znalezione.add((slowo1+" "+przywrocslowa[slowobrakujace]))
        #if i1%100==0:
        #print(i1/total_words*100, "%")
    #print(znalezione)
    znalezione2=set()
    for slowo in znalezione:
        if slowo==osoba or slowo in znalezione2 or ' '.join(slowo.split()[::-1]) in znalezione2: continue
        znalezione2.add(slowo)
    return znalezione2

for slowa in gen("Mikołaj Kopernik"):
    print(slowa)
# print(sorted('wsparł'))
# print('aprswł' in slowasort)