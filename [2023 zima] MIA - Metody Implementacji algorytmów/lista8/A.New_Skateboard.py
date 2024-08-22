a=input()
ans=0
for c in a:
    if int(c)%4==0: ans+=1
for i in range(len(a)-2, -1, -1):
    #print(a[i:i+2])
    if int(a[i:i+2])%4==0: ans+=i+1
print(ans)
