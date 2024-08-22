def solve(zagadka):
    zagadka=zagadka.split()
    pierwsze=zagadka[0]
    drugie=zagadka[2]
    suma=zagadka[4]
    litery=set()
    for slowo in [pierwsze, drugie, suma]:
        for litera in slowo:
            litery.add(litera)
    litery = list(litery)
    litery2={i:-1 for i in litery}
    return brut(litery, litery2, zagadka, 0, [True for i in range(10)])

def check(litery, zagadka):
    #print(litery)
    litery[' ']=0
    pierwsze=zagadka[0]
    drugie=zagadka[2]
    suma=zagadka[4]
    pierwsze=' '*(len(suma)-len(pierwsze))+pierwsze
    drugie=' '*(len(suma)-len(drugie))+drugie
    reszta=0
    for i in range(len(suma)-1, -1, -1):
        wynik=litery[pierwsze[i]]+litery[drugie[i]]+reszta
        reszta=0
        if wynik>=10:
            reszta=1
            wynik-=10
        if litery[suma[i]]!=wynik: return False
    return True

def brut(skladliter, litery, zagadka, depth, freedigit):
    #print(litery, zagadka, depth, freedigit)
    if depth==len(skladliter):
        if check(litery, zagadka):
            return litery
        else: return False
    for i in range(10):
        if freedigit[i]:
            freedigit[i]=False
            litery[skladliter[depth]]=i
            res=brut(skladliter, litery, zagadka, depth+1, freedigit)
            if res: return res
            freedigit[i]=True
print(solve('send + more = money'))
print(solve('ciacho + ciacho = nadwaga'))
print(solve('komputer + ja = eksplozja'))
#print(check({'a':1,'b':1,'c':2}, 'a + b = c'))