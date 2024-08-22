slowa=[]
with open("popularne_slowa2023.txt") as f:
    for slowo in f.read().split():
        if len(slowo)<4: continue
        slowa.append(slowo)
poczatki={}
for slowo in slowa:
    if slowo[:4] in poczatki:
        poczatki[slowo[:4]]+=1
    else:
        poczatki[slowo[:4]]=1
poczatki=[(poczatki[key], key) for key in poczatki]
poczatki.sort(reverse=True)
for poczatek in poczatki[:10]:
    print(poczatek[1], poczatek[0], "wystąpień,", poczatek[0]/len(slowa)*100, "%")
for poczatek in poczatki:
    if poczatek[0]==100: print(poczatek[1], poczatek[0], "wystąpień,", poczatek[0]/len(slowa)*100, "%")
for slowo in slowa:
    if slowo[:4]==poczatki[9][1]: print(slowo)