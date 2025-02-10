#include <bits/stdc++.h>

using namespace std;

const double SQRT2=1.41421356237;

double mysqrt(double R)
{
    int c=0;
    while(R>1)
    {
        R=R/2;
        c++;
    }
    double wynik = 1;
    if(c%2!=0)
    {
        wynik*=SQRT2;
    }
    wynik*=pow(2, c/2);
    int steps=10;
    double x=R/2;
    while(steps!=0)
    {
        x=x*0.5 + 0.5*R/x;
        steps--;
    }
    return wynik*x;
}

int main()
{
    cout<<setprecision(3000);
    cout<<mysqrt(7)<<"\n";
    return 0;
}