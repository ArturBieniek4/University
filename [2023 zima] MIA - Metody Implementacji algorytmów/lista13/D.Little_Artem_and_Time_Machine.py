n=int(input())
SQ=316
operations=[{} for i in range(100000)]
sumoperations=[{} for i in range((100000)//SQ+1)]
compress={}
compcnt=0
queries=[]
tocompress=[]
for zap in range(n):
    a, t, x = map(int, input().split())
    tocompress.append(t)
    queries.append((a,t,x))

tocompress.sort()

for t in tocompress:
    if t not in compress:
        compress[t]=compcnt
        compcnt+=1
    t=compress[t]

for a,t,x in queries:
    t=compress[t]
    if a==3:
        part=t//SQ
        c=0
        for p in range(0, part):
            if x in sumoperations[p]:
                c+=sumoperations[p][x]
        for i in range(part*SQ, t):
            if x in operations[i]:
                c+=operations[i][x]
        print(c)
    else:
        sgn=1
        if a==2: sgn=-1
        if x not in operations[t]:
            operations[t][x]=0
        operations[t][x]+=sgn
        part=t//SQ
        if x not in sumoperations[part]:
            sumoperations[part][x]=0
        sumoperations[part][x]+=sgn
