n=int(input())
order=map(int, input().split())
waselem=[False for i in range(n+1)]
lastput=n+1
for i,cake in enumerate(order):
    shouldbeupto=n-i
    waselem[cake]=True
    if cake==lastput-1:
        for j in range(cake, shouldbeupto-1, -1):
            if not waselem[j]: break
            lastput-=1
            print(lastput, end=" ")
    print("")
