#include <bits/stdc++.h>

using namespace std;

#define MAXN 200005
vector<int>v[MAXN]; // wszystkie bidy danego id
int del[MAXN]; // kolejne usunięcia w danym zapytaniu

int main()
{
    ios_base::sync_with_stdio(false);
    cout.tie(0);
    cin.tie(0);
    int n;
    cin>>n;
    for(int i=0; i<n; i++)
    {
        int a,b;
        cin>>a>>b;
        v[a].push_back(b);
    }
    set<pair<int,int>>s; // max bidy każdego
    for(int i=1; i<=n; i++)
        if(v[i].size()) s.insert(make_pair(v[i].back(),i));
    int q;
    cin>>q;
    while(q--)
    {
        int k;
        cin>>k;
        for(int i=0; i<k; i++)
        {
            cin>>del[i];
            if(v[del[i]].size()) // jeżeli usuwany złożył jakiegokolwiek bida
                s.erase(make_pair(v[del[i]].back(),del[i])); // usuń jego największy bid z seta
        }
        if(s.size()==0) cout<<"0 0\n"; // jeżeli nie ma największych bidów (czyli usunięte wszystikie bidy defacto) to 0 0
        else if(s.size()==1) // jeżeli został 1 bid największy to go wypisz, bo został tylko 1 licytujący
            cout<<s.begin()->second<<" "<<v[s.begin()->second][0]<<endl; // ale wypisz pierwszy jego bid, bo każdy następny jest wtedy niepoprawny
        else
        {
            set<pair<int,int>>::iterator it=s.end();
            it--;
            int pos=it->second; // wielkość największego bida
            it--; // drugi największy, wiemy że istnieje bo size>=2
            int num=it->first; // id tego kto składał drugi największy
            int ans=upper_bound(v[pos].begin(),v[pos].end(),num)-v[pos].begin(); // szukamy ostatniego bida tego kto złożył największy, który jest mniejszy od największego bida tego kto złożył drugi największy
            cout<<pos<<" "<<v[pos][ans]<<endl;
        }
        for(int i=0; i<k; i++)
            if(v[del[i]].size()) s.insert(make_pair(v[del[i]].back(),del[i])); // dodaj spowrotem te największe bidy usuwanych
    }
    return 0;
}
