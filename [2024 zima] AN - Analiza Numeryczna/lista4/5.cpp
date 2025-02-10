#include <bits/stdc++.h>

using namespace std;

double newton(double x, double R, int steps)
{
    while(steps!=0)
    {
        x=x*(2-x*R);
        steps--;
    }
    return x;
}

int main()
{
    cout<<setprecision(3000);
    cout<<newton(0.1, 7, 5)<<"\n";
    cout<<newton(0.1, 7, 6)<<"\n";
    cout<<newton(0.1, 7, 7)<<"\n";

    cout<<"\n";

    cout<<newton(0.1, 3, 6)<<"\n";
    cout<<newton(0.1, 3, 7)<<"\n";
    cout<<newton(0.1, 3, 8)<<"\n";

    cout<<"\n";

    cout<<newton(0.05, 11, 5)<<"\n";
    cout<<newton(0.05, 11, 6)<<"\n";
    cout<<newton(0.05, 11, 7)<<"\n";
    return 0;
}