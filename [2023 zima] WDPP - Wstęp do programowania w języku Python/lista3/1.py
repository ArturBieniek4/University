def isPrime(n):
    i=2
    while i*i<=n:
        if n%i==0:
            return False
        i+=1
    return True
def isHappy(n):
    return (str(n).find('777')!=-1)
cnt=0
for i in range(1, 100000+1):
    if isPrime(i) and isHappy(i):
        print(i)
        cnt+=1
print("Znaleziono", cnt, "liczb.")