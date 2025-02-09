def check_prefix(pre, lista_slow):
    words=0
    for slowo in lista_slow:
        if len(slowo)>=len(pre) and slowo[:len(pre)]==pre:
            words+=1
        if words>=3: return True
    return False

def gen_prefix(pre, lista_slow):
    maxprefix=pre
    for c in range(ord('a'), ord('z')+1):
        c=chr(c)
        newpre=pre+c
        if check_prefix(newpre, lista_slow):
            if(len(newpre)>len(maxprefix)):
                maxprefix=newpre
            nextpre=gen_prefix(newpre, lista_slow)
            if(len(nextpre)>len(maxprefix)):
                maxprefix=nextpre
    return maxprefix

def common_prefix(lista_slow):
    lista_slow=[slowo.lower() for slowo in lista_slow]
    return gen_prefix("", lista_slow)

print(common_prefix(["Cyprian", "cyberotoman", "cynik", "ceniąc", "czule"]))
print(common_prefix(["warszawa", "warga", "warunek", "warka", "wariant"]))
print(common_prefix(["presja", "prezent", "prezenter", "prezes", "prefiks"]))