n=int(input())
for i in range(n):
    a,b,c=map(int,input().split())
    c=c%2
    a+=c
    #print(a,b,c)
    if a>b: print("First")
    else: print("Second")
