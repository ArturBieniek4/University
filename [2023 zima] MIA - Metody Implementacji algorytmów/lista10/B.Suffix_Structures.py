s=input()
t=input()
if sorted(s)==sorted(t):
    print("array")
else:
    ans="both"
    j=0
    cnt=0
    for char in t:
        while j<len(s) and s[j]!=char: j+=1
        if j<len(s) and s[j]==char:
            cnt+=1
            j+=1
    if cnt==len(t): ans="automaton"
    litery_s={}
    litery_t={}
    for litera in s:
        if litera not in litery_s: litery_s[litera]=0
        litery_s[litera]+=1
    for litera in t:
        if litera not in litery_t: litery_t[litera]=0
        litery_t[litera]+=1
    for litera in litery_t:
        if litera not in litery_s or litery_s[litera]<litery_t[litera]:
            ans="need tree"
            break
    print(ans)
