from math import log2
brown1=list(open('brown.txt', 'r').read().split())
brown=[]
wyst_liter={}
sumawyst=0
for slowo in brown1:
    noweslowo=""
    for litera in slowo.lower():
        if litera.isalpha():
            noweslowo+=litera
            sumawyst+=1
            if litera in wyst_liter:
                wyst_liter[litera]+=1
            else:
                wyst_liter[litera]=1
    if len(noweslowo)>0:
        brown.append(noweslowo)

#print(brown)
#for litera in wyst_liter:
#    print(litera, wyst_liter[litera]/sumawyst)

entropia=0
for litera in wyst_liter:
    entropia-=(wyst_liter[litera]/sumawyst)*log2(wyst_liter[litera]/sumawyst)
print(entropia)

trojki={}
for i,ostatnie in enumerate(brown):
    if i<2: continue
    trojka=' '.join([brown[i-2], brown[i-1], ostatnie])
    if trojka in trojki:
        trojki[trojka]+=1
    else:
        trojki[trojka]=1
trojki=[(trojka, trojki[trojka]) for trojka in trojki]
trojki.sort(key=lambda x:x[1], reverse=True)
print(trojki[:30])
lastpoland=brown.index('poland')
nextpoland=brown.index('poland')
najczestsze_poland={}
for i,slowo in enumerate(brown):
    if i+25<len(brown):
        if brown[i+25]=='poland':
            nextpoland=i+25
    if slowo=='poland':
        lastpoland=i
    if abs(nextpoland-i)<25 or abs(lastpoland-i)<25:
        if slowo in najczestsze_poland:
            najczestsze_poland[slowo]+=1
        elif len(slowo)>=5:
            najczestsze_poland[slowo]=1
najczestsze_poland=[(slowo, najczestsze_poland[slowo]) for slowo in najczestsze_poland]
najczestsze_poland.sort(key=lambda x:x[1], reverse=True)
print(najczestsze_poland[:20])