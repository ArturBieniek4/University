#include <bits/stdc++.h>

using namespace std;

template <typename T> int sgn(T val) {
    return (T(0) < val) - (val < T(0));
}

double f(double x)
{
    return x*x-atan(x+2);
}

double bisekcja(double (*f)(double), double a, double b, int steps)
{
    cout<<"bisekcja("<<a<<", "<<b<<", "<<steps<<")\n";
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
    cout<<setprecision(10);
    cout<<bisekcja(f, 1, 1.5, 20)<<"\n";
    cout<<bisekcja(f, -1, -0.5, 20)<<"\n";
    return 0;
}