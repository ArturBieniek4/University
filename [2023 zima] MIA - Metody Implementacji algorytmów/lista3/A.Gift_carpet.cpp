#include <bits/stdc++.h>

using namespace std;

int main()
{
    ios_base::sync_with_stdio(false);
    cin.tie(0);
    cout.tie(0);
    int z;
    cin>>z;
    string word="vika";
    for(int t=0;t<z;t++)
    {
        char plansza[25][25];
        int n,m;
        cin>>n>>m;
        for(int row=0;row<n;row++)
        {
            for(int col=0;col<m;col++)
            {
                cin>>plansza[row][col];
            }
        }
        int score=0;
        for(int col=0;col<m;col++)
        {
            for(int row=0;row<n;row++)
            {
                if(score<word.length() && plansza[row][col]==word[score])
                {
                    score++;
                    //cout<<"COL="<<col<<" "<<"ROW="<<"row"<<" SCORE="<<score<<"\n";
                    break;
                }
            }
        }
        if(score==word.length())
        {
            cout<<"YES\n";
        }
        else cout<<"NO\n";
    }
    return 0;
}
