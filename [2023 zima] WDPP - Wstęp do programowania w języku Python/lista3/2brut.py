def isPrime(n):
    i=2
    while i*i<=n:
        if n%i==0:
            return False
        i+=1
    return True
def isHyperHappy(n):
    return (str(n).find('7777777')!=-1)
cnt=0
for i in range(1000000000, 9999999999):
    if isHyperHappy(i) and isPrime(i):
        print(i)
        cnt+=1
print("Znaleziono", cnt, "liczb.")