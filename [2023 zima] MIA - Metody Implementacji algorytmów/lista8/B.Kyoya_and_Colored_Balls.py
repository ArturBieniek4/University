NMAX=1005
MOD=10**9+7
dp=[[0 for i in range(NMAX)] for i in range(NMAX)]
dp[0][0]=1
for i in range(1, NMAX):
    dp[i][0]=1
    for j in range(1,i+1):
        dp[i][j]=(dp[i-1][j]+dp[i-1][j-1])%MOD
k=int(input())
ans=1
total=0
for i in range(k):
    kolor=int(input())
    total+=kolor
    ans=(ans*(dp[total-1][kolor-1]))%MOD
print(ans)
