t=int(input())
for test in range(t):
    n=int(input())
    tab=map(int,input().split())
    begones=0
    for el in tab:
        if el==1:
            begones+=1
        else:
            break
    if begones==n:
        begones-=1
    if begones%2==0:
        print("First")
    else:
        print("Second")
        
