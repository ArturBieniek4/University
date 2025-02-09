pali=dict()
with open("popularne_slowa2023.txt") as f:
    for line in f:
        line=line.strip()
        if line not in pali and line[::-1] not in pali:
            pali[line]=False
        elif line not in pali:
            pali[line[::-1]]=True
        elif line[::-1] not in pali:
            pali[line]=True
#print(pali)
for p in pali:
    if pali[p]==True:
        print(p, "-", p[::-1])