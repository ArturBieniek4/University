#include <bits/stdc++.h>

using namespace std;

long double a,b,c;

int main()
{
    cin>>a>>b>>c;
    if(a<=0 || b<=0 || c<=0)
    {
        clog<<"Długości boków trójkąta muszą być dodatnie\n";
        // throw invalid_argument("Długości boków trójkąta muszą być dodatnie\n");
        return 1;
    }
    if (a+b>c && a+c>b && b+c>a)
    {
        long double p = a+b+c;
        cout<<fixed<<setprecision(3)<<p<<"\n";
        p=p/2;
        long double pole = sqrt(p*(p-a)*(p-b)*(p-c));
        cout<<fixed<<setprecision(3)<<pole<<"\n";
    }
    else
    {
        clog<<"Takiego trójkąta nie da się skonstruować\n";
        // throw invalid_argument("Takiego trójkąta nie da się skonstruować\n");
        return 1;
    }
    return 0;
}