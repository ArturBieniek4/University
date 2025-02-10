#include <bits/stdc++.h>

using namespace std;

template <typename T> int sgn(T val) {
    return (T(0) < val) - (val < T(0));
}

double f(double x)
{
    return x-0.49;
}

double bisekcja(double (*f)(double), double a, double b, int steps)
{
    // cout<<"bisekcja("<<a<<", "<<b<<", "<<steps<<")\n";
    double m=(a+b)/2.0;
    if(steps==0) return m;
    double fm=f(m);
    double fa=f(a);
    double fb=f(b);
    if(sgn(fm)!=sgn(fa)) return bisekcja(f, a, m, steps-1);
    if(sgn(fm)!=sgn(fb)) return bisekcja(f, m, b, steps-1);
    return m;
}

int main()
{
    double a0=0, b0=1;
    for(int i=1; i<=5; i++)
    {
        cout<<abs(0.49-bisekcja(f, a0, b0, i))<<" "<<pow(2, -i-1)*(b0-a0)<<"\n";
    }
    return 0;
}