n=int(input())
MOD=10**9+7
MAXNUM=10**6+5
tab=list(map(int, input().split()))
cnt=[0 for i in range(MAXNUM)]
cnt[0]=1
for i in range(n):
    div=[]
    d=1
    while d*d<=tab[i]:
        if tab[i]%d==0:
            div.append(d)
            if d!=tab[i]//d:
                div.append(tab[i]//d)
        d+=1
    div.sort(reverse=True)
    # print(div)
    for d in div:
        # print(d)
        cnt[d]+=cnt[d-1]
        cnt[d]%=MOD
ans=0
for i in range(1, n+1):
    # print(cnt[i])
    ans+=cnt[i]
    ans%=MOD
print(ans)
