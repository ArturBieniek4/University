#include <bits/stdc++.h>

using namespace std;

int maxdepth, x;

#define MAXLEN 1000005

char sol[MAXLEN];
char minsol[MAXLEN];
int minerr=INT_MAX;

void check(int a, int b)
{
    int len=0;
    while(a!=b && a>=0 && b>=0)
    {
        if(len>maxdepth-1) return;
        if(a>b)
        {
            sol[len++]='T';
            a-=b;
        }

        else
        {
            sol[len++]='B';
            b-=a;
        }
    }
    if(len!=maxdepth-1 || a!=1) return;
    sol[len]='T';
    int err=0;
    for(int i=0;i<len;i++)
    {
        if (sol[i]==sol[i+1]) err++;
    }
    if(err<minerr)
    {
        minerr=err;
        for(int i=0;i<=len;i++)
        {
            minsol[i]=sol[len-i];
        }
        minsol[len+1]='\0';
    }
}

int main()
{
    ios_base::sync_with_stdio(false);
    cin.tie(0);
    cout.tie(0);
    cin>>maxdepth>>x;
    for(int i=1;i<=x;i++)
    {
        check(i, x);
        check(x, i);
    }
    if(minerr==INT_MAX) cout<<"IMPOSSIBLE\n";
    else cout<<minerr<<'\n'<<minsol<<"\n";
    return 0;
}
