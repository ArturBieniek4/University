n,m = map(int, input().split())
elementy=list(map(int, input().split()))
queries=list(map(int, input().split()))
queries = [(q, i) for i,q in enumerate(queries)]
elementy.sort()
queries.sort()
i=0
wynik=0
ans=[0 for i in range(m)]
for q in queries:
    #print("q=", q)
    #print("i=", i)
    while i<n and elementy[i]<=q[0]:
        #print("i=", i)
        wynik+=1
        i+=1
    #i+=1
    ans[q[1]]=wynik
for a in ans:
    print(a)
