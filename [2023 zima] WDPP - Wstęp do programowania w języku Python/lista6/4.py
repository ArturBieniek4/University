def podziel(s, sep=" "):
    sol=[]
    for i,c in enumerate(s):
        if c!=sep and (i==0 or s[i-1]==sep):
            sol.append(c)
        elif c!=sep:
            sol[-1]+=c
    return sol

print(podziel("       Ala ma         kota "))