n,p,t = map(float, input().split())
n,t=map(int, (n,t))
dp=[[0 for i in range(max(n, t)+1)] for i in range(max(n, t)+1)]
for i in range(1, t+1):
    for j in range(1, n+1):
        dp[i][j] = (1-p)*dp[i-1][j] + p*(1+dp[i-1][j-1])
print(dp[t][n])
