#include <bits/stdc++.h>

using namespace std;

int main()
{
    ios_base::sync_with_stdio(false);
    cin.tie(0);
    cout.tie(0);
    int n,q;
    cin>>n>>q;
    int array[n];
    for(int i=0;i<n;i++)
    {
        cin>>array[i];
    }
    int poczatek[n];
    int koniec[n];
    fill(poczatek,poczatek+n,0);
    fill(koniec,koniec+n,0);
    for(int i=0;i<q;i++)
    {
        int l,r;
        cin>>l>>r;
        l--;r--;
        poczatek[l]+=1;
        koniec[r]+=1;
    }
    int akt=0;
    int wyst[n];
    for(int i=0;i<n;i++)
    {
        akt+=poczatek[i];
        wyst[i]=akt;
        //cout<<poczatek[i]<<" "<<koniec[i]<<" "<<akt<<"\n";
        akt-=koniec[i];
    }
    sort(array,array+n);
    sort(wyst,wyst+n);
    long long ans=0;
    for(int i=0;i<n;i++)
    {
        //cout<<wyst[i]<<" "<<array[i]<<"\n";
        ans+=((long long)wyst[i])*((long long)array[i]);
    }
    cout<<ans;
    return 0;
}
