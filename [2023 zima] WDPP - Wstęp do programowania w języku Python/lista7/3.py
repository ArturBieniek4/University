polskie=set()
with open("popularne_slowa2023.txt") as f:
    for line in f:
        polskie.add(line.strip().lower())
lalka=[]
with open("lalka.txt") as f:
    lalka=f.read().split()
maxciag=""
aktciag=""
aktciagdl=0
maxciagdl=0
for i,slowo in enumerate(lalka):
    slowo2=""
    zle=False
    for c in slowo:
        c=c.lower()
        if c.isalpha(): slowo2+=c
        if ord(c)>122: zle=True
        if zle: break
    if zle or slowo2 not in polskie:
        aktciag=""
        aktciagdl=0
        continue
    aktciag+=slowo+" "
    aktciagdl+=len(slowo2)
    if aktciagdl>maxciagdl:
        maxciagdl=aktciagdl
        maxciag=aktciag
        print(i, len(lalka), aktciag, slowo, slowo2, aktciagdl, maxciagdl)
print('\n',maxciag)
#print(ord("z"))