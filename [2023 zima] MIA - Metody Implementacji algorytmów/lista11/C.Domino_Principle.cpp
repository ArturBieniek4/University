#include <bits/stdc++.h>

using namespace std;

int main()
{
    ios_base::sync_with_stdio(false);
    cin.tie(0);
    cout.tie(0);
    int n;
    cin>>n;
    pair<pair<int,int>,int> domina[n];
    for(int i=0;i<n;i++)
    {
        int x,h;
        cin>>x>>h;
        domina[i]=make_pair(make_pair(x,h), i);
    }
    sort(domina, domina+n);
    int remap[n];
    for(int i=0;i<n;i++)
    {
        remap[domina[i].second]=i;
    }
    int ans[n];
    stack<pair<int,int>> st;
    st.push(make_pair(INT_MAX, n));
    for(int i=n-1;i>=0;i--)
    {
        while(!st.empty() && (domina[i].first.first+domina[i].first.second)>(st.top().first))
        {
            st.pop();
        }
        if(!st.empty())
            ans[i]=st.top().second-i;
        else
            ans[i]=1;
        st.push(make_pair(domina[i].first.first, i));
    }
    for(int i=0;i<n;i++)
    {
        cout<<ans[remap[i]]<<" ";
    }
    return 0;
}
