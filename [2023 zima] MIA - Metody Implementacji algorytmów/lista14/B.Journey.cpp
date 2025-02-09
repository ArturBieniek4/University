#include <bits/stdc++.h>

#define MAX_N 100005

using namespace std;

int n;
vector<int> graph[MAX_N];
bitset<MAX_N> visited;

double dfs(int node, int depth)
{
    // cout<<"VIS "<<node<<" DEPTH "<<depth<<"\n";
    visited[node]=true;
    double cnt=0;
    double suma=0;
    for(auto& v: graph[node])
    {
        if(!visited[v])
        {
            suma+=dfs(v, depth+1);
            cnt+=1;
        }
    }
    if(cnt==0) return depth;
    return suma/cnt;
}

int main()
{
    ios_base::sync_with_stdio(false);
    cin.tie(0);
    cout.tie(0);
    cout.precision(20);
    cout<<fixed;
    cin>>n;
    for(int i=0;i<n-1;i++)
    {
        int a,b;
        cin>>a>>b;
        graph[a].push_back(b);
        graph[b].push_back(a);
    }
    cout<<dfs(1,0);
    return 0;

}
