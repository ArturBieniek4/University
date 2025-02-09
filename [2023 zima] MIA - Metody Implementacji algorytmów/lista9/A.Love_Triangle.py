n=int(input())
lubi=list(map(int,input().split()))
def check():
    for a in range(n):
        #print("a,A=",a,lubi[a])
        for b in range(n):
            #print("b,B=",b,lubi[b])
            if a!=b and lubi[a]==b+1:
                for c in range(n):
                    #print("c,C=",c,lubi[c])
                    if b!=c and a!=c and lubi[b]==c+1 and lubi[c]==a+1:
                        return True
    return False
if check(): print("YES")
else: print("NO")
