#include <bits/stdc++.h>

using namespace std;

double f1(double x)
{
    return x*x*x-x-1;
}

double f1_prim(double x)
{
    return 3*x*x-1;
}

double f1_bis(double x)
{
    return 6*x;
}

double f2(double x)
{
    return sin(x);
}

double f2_prim(double x)
{
    return cos(x);
}

double f2_bis(double x)
{
    return -sin(x);
}

double f3(double x)
{
    return pow(x, 7) - 3*pow(x, 4);
}

double f3_prim(double x)
{
    return 7*pow(x, 6) - 3*4*pow(x, 3);
}

double f3_bis(double x)
{
    return 7*6*pow(x, 5) - 3*4*3*pow(x,2);
}

double olver(double (*f)(double), double(*f_prim)(double), double(*f_bis)(double), double xn, int its)
{
    for(int i=1;i<=its;i++)
    {
        xn=xn-(f(xn)/f_prim(xn))-0.5*(f_bis(xn)/f_prim(xn))*pow(f(xn)/f_prim(xn), 2);
        cout<<"x"<<i<<"="<<xn<<"\n";
    }
    return xn;
}

double olver_rzad(double (*f)(double), double(*f_prim)(double), double(*f_bis)(double), double xn, int its, double alfa)
{
    for(int i=1;i<=its;i++)
    {
        xn=xn-(f(xn)/f_prim(xn))-0.5*(f_bis(xn)/f_prim(xn))*pow(f(xn)/f_prim(xn), 2);
        // cout<<"x"<<i<<"="<<xn<<"\n";
    }
    double xnmin1=xn;
    xn=xn-(f(xn)/f_prim(xn))-0.5*(f_bis(xn)/f_prim(xn))*pow(f(xn)/f_prim(xn), 2);
    double xn0=xn;
    xn=xn-(f(xn)/f_prim(xn))-0.5*(f_bis(xn)/f_prim(xn))*pow(f(xn)/f_prim(xn), 2);
    double xn1=xn;
    // cout<<xnmin1<<" "<<xn<<" "
    double p = log((xn1-alfa)/(xn0-alfa))/log((xn0-alfa)/(xnmin1-alfa));
    return p;
}

template <typename T> int sgn(T val) {
    return (T(0) < val) - (val < T(0));
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
    cout<<olver_rzad(f1, f1_prim, f1_bis, 90, 7, 1.32472)<<"\n";
    cout<<olver_rzad(f1, f1_prim, f1_bis, 39, 5, 1.32472)<<"\n";
    cout<<olver_rzad(f2, f2_prim, f2_bis, 3000, 1, 0)<<"\n";
    cout<<olver_rzad(f3, f3_prim, f3_bis, 32, 5, 0)<<"\n";
    return 0;
}