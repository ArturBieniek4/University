def f1(l):
    return [x for x in l if x in [(l1**2+l2**2 if l1!=l2 else None) for l1 in l for l2 in l]]

def f2(l):
    return [x if x%7 else 0 for x in l if x<=10 or x%7==0]

def f3(s1, s2):
    return ''.join([l for l in s1 if l==l.lower() and l.isalpha() and l in s2])

def f4(ll):
    return sum([sum([c for i,c in enumerate(l) if i%2==0 and c%2==1]) for l in ll])

print(f1([1,2,3,4,5]))
print(f1([1,2,2,3,3,3,4,5,6,8,10]))
print(f2([3,7,12,5,14,18,20,2]))
print(f2([1,2,3,4,5,6,7]))
print(f3('Wroclaw Srodmiescie', 'Zalew Szczecinski'))
print(f3('Oborniki Śląskie', 'Paprykarz Szczeciński'))
print(f4([[1,2,3,6,8]]))
print(f4([[10], [3,4,5], [200,300,301]]))