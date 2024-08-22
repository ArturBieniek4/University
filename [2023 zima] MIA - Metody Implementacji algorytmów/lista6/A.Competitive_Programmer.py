n=int(input())
for test in range(n):
    liczba=input()
    sumacyfr=0
    iszero=False
    div2=0
    for cyfra in liczba:
        cyfra=int(cyfra)
        sumacyfr+=cyfra
        if cyfra==0:
            iszero=True
        if cyfra%2==0:
            div2+=1
    if sumacyfr%3==0 and div2>=2 and iszero:
        print("red")
    else:
        print("cyan")
