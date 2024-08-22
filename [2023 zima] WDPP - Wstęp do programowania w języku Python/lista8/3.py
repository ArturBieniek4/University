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
slowa=set(open("popularne_slowa2023.txt").read().split())
total_words=len(slowa)
def gen(osoba):
    osoba=osoba.lower()
    l=len(osoba)
    znalezione=set()
            
    for i1,slowo1 in enumerate(slowa):
        l1=len(slowo1)
        if l1>l: continue
        if not ukladalne(slowo1, osoba): continue
        for i2,slowo2 in enumerate(slowa):
            if i1==i2 or slowo1==slowo2: continue
            l2=len(slowo2)
            if l1+l2+1!=l: continue
            if ukladalne(slowo1+" "+slowo2, osoba):
                print(slowo1+" "+slowo2)
                znalezione.add(slowo1+" "+slowo2)
        #if i1%100==0:
        print(i1/total_words*100, "%")
    znalezione2=set()
    for slowo in znalezione:
        if slowo==osoba or slowo in znalezione2 or ' '.join(slowo.split()[::-1]) in znalezione2: continue
        znalezione2.add(slowo)
    return znalezione2

for slowa in gen("Bolesław Prus"):
    print(slowa)