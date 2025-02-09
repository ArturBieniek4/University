#include <bits/stdc++.h>

using namespace std;

vector<int64_t> rozklad(int64_t n)
{
    vector<int64_t> r;
    if(n==-1 || n==0 || n==1)
    {
        r.push_back(n);
    }
    if(n<0)
    {
        r.push_back(-1);
    }
    while(n%2==0)
    {
        r.push_back(2);
        n/=2;
    }
    int64_t sq=sqrt(abs(n));
    for(int64_t i=3;i<=sq;i+=2)
    {
        while(n%i==0)
        {
            r.push_back(i);
            n/=i;
        }
    }
    if(n!=1 && n!=-1)
    {
        r.push_back(abs(n));
    }
    return r;
}

int main(int argc, const char* argv[])
{
    for(int i=1; i<argc; i++)
    {
        try
        {
        int64_t liczba = stoll(argv[i]);
        vector<int64_t> r=rozklad(liczba);
        for(int i=0;i<r.size();i++)
        {
            cout<<r[i];
            if(i<r.size()-1) cout<<"*";
        }
        cout<<"\n";
        }
        catch(invalid_argument)
        {
            clog<<"Błąd dla argumentu "<<argv[i]<<"\n";
        }
    }
    return 0;
}