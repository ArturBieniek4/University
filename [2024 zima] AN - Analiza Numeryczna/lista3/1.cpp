#include <iostream>
#include <math.h>

using namespace std;

double a(double x)
{
    return pow(pow(x,5)+sqrt(pow(x,10)+2024), -1);
}

double a_safe(double x)
{
    if(x<0) return (pow(x, 5)-sqrt(pow(x, 10)+2024))/2024.0;
    return pow(pow(x,5)+sqrt(pow(x,10)+2024), -1);
}

double b(double x)
{
    return pow(10, 8)*(exp(x)-exp(2*x));
}

double b_safe(double x)
{
    double wynik=0;
    double silnia=1.0;
    for(int i=1; i<10; i++)
    {
        silnia*=i;
        wynik-=(x*(pow(2, i)-1))/silnia;
    }
    return wynik*pow(10, 8);
}

double c(double x)
{
    return 6*pow(x, -3)*(asin(x)-x);
}

double c_safe(double x)
{
    if(abs(x)>0.5) return c(x);
    double wynik = 0;
    double silnia_parzysta = 1;
    double silnia_nieparzysta = 1;
    double xpow = 1;
    for(int i=1; i<10; i++)
    {
        silnia_parzysta*=i*2;
        silnia_nieparzysta*=(2*i-1);
        // cout<<"wynik+="<<xpow<<"*"<<silnia_nieparzysta<<"/"<<silnia_parzysta<<"/"<<(2*i+1)<<"\n";
        wynik+=xpow*silnia_nieparzysta/silnia_parzysta/(2*i+1);
        xpow*=x*x;
    }
    return wynik*6;
}

double d(double x)
{
    return 4*pow(cos(x), 2)-1;
}

double d_safe(double x)
{
    double result=0.5;
    double sign=-1;
    double powx=x*x;
    double fact=2;
    for(int i=2;i<=20;i+=2)
    {
        result+=sign*powx/fact;
        powx*=x*x;
        fact*=(i+1)*(i+2);
        sign*=-1;
    }
    return result*(result+1)*4;
}

int main()
{
    cout<<a(pow(-10, 5))<<"\n";
    cout<<a_safe(pow(-10, 5))<<"\n";
    cout<<b(pow(10, 21))<<"\n";
    cout<<b_safe(pow(10, 21))<<"\n";
    cout<<c(-0.000000001)<<"\n";
    cout<<c_safe(-0.0000000001)<<"\n";
    cout<<d(M_PI/3.0)<<"\n";
    cout<<d_safe(M_PI/3.0)<<"\n";
    return 0;
}