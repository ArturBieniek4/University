liczba=input()
a,b=map(int, input().split())
r=[False for i in range(len(liczba)+1)]
r[len(liczba)]=0
xp=1
for i in range(len(liczba)-1, -1, -1):
    r[i]=(r[i+1]+int(liczba[i])*xp)%b
    xp*=10
    xp%=b
solution=False
l=0
for i in range(len(liczba)-1):
    x=int(liczba[i])
    #print(l,xp,x)
    l=(l*10+x)%a
    # print(l, r[i+1], liczba[:i+1], liczba[i+1:])
    if l==0 and r[i+1]==0 and liczba[i+1]!="0" and liczba[0]!="0":
        print("YES", liczba[:i+1], liczba[i+1:], sep="\n")
        solution=True
        break
if not solution: print("NO")
