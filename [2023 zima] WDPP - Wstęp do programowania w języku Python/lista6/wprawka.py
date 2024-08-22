def gcd(a,b):
    while a!=0 and b!=0:
        if b>a: a,b=b,a
        a%=b
    return b

def nww(a,b):
    return a*b//gcd(a,b)

def skroc(licz,mian):
    g=gcd(licz,mian)
    licz//=g
    mian//=g
    if mian<0:
        mian*=-1
        licz*=-1
    return licz, mian

def wspolny(licz, mian, licz2, mian2):
    wm=nww(mian, mian2)
    mnoz1=wm//mian
    licz*=mnoz1
    mnoz2=wm//mian2
    licz2*=mnoz2
    return licz, wm, licz2, wm

def add(l1,m1,l2,m2):
    l1,m1,l2,m2=wspolny(l1,m1,l2,m2)
    return skroc(l1+l2,m1)

def sub(l1,m1,l2,m2):
    l1,m1,l2,m2=wspolny(l1,m1,l2,m2)
    return skroc(l1-l2,m1)

def mult(l1,m1,l2,m2):
    return skroc(l1*l2, m1*m2)

def div(l1,m1,l2,m2):
    return skroc(l1*m2,l2*m1)

print(gcd(9, 28))
print(skroc(3,9))
print(nww(3,9))
print(wspolny(1,3, 1,10))
print(add(1,2,1,3))
print(sub(1,3,1,2))
print(mult(1,2,4,5))
print(div(1,2,1,4))