n=int(input())
tab=list(map(int,input().split()))
q=int(input())
SQ=547
queries=[[] for i in range(SQ)]
ans=[None for i in range(q)]
for zap in range(q):
    start,step=map(int,input().split())
    start-=1
    if step>=SQ:
        suma=0
        for i in range((n-start-1)//step+1):
            suma+=tab[start+step*i]
        ans[zap]=suma
    else:
        queries[step].append((zap,start))
for step in range(SQ):
    if len(queries[step])>0:
        pre=[0 for i in range(n+5+step)]
        for i in range(n-1, -1, -1):
            pre[i]=pre[i+step]+tab[i]
        # print(pre)
        for q, start in queries[step]:
            ans[q]=pre[start]
for a in ans:
    print(a)
    
