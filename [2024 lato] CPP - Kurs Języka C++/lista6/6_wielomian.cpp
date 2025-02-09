#include "6_wielomian.hpp"
#include <bits/stdc++.h>
using namespace std;

Wielomian::Wielomian(int st, double wsp)
{
    if(wsp==0 && st!=0) throw invalid_argument("Współczynnik przy najwyższej potędze nie może wynosić 0.");
    n=st;
    a = new double[st+1]{};
    a[n] = wsp;
}

Wielomian::Wielomian(int st, const double wsp[])
{
    if(wsp[st]==0 && st!=0) throw invalid_argument("Współczynnik przy najwyższej potędze nie może wynosić 0.");
    n=st;
    a = new double[st+1];
    for(int i=0;i<=st;i++)
        a[i] = wsp[n-i];
}

Wielomian::Wielomian(initializer_list<double> wsp)
{
    n=wsp.size()-1;
    a = new double[n+1];
    int i=n;
    for(auto &s:wsp)
    {
        if(i==n && s==0 && n!=0) throw invalid_argument("Współczynnik przy najwyższej potędze nie może wynosić 0.");
        a[i--] = s;
    }
}

Wielomian::Wielomian(const Wielomian& w)
{
    n=w.n;
    a=new double[n];
    for(int i=0;i<=n;i++)
        a[i]=w.a[i];
}

Wielomian::Wielomian(Wielomian&& w) : Wielomian(w.n)
{
    swap(n,w.n);
    swap(a, w.a);
}

Wielomian::~Wielomian()
{
    delete[] a;
}

const Wielomian &Wielomian::operator=(const Wielomian& w) {
    if(&w==this) return *this;
    this->~Wielomian();
    this->n=w.n;
    a=new double[n+1];
    for(int i=0;i<=n;i++)
    {
        a[i]=w.a[i];
    }
    return *this;
}

const Wielomian &Wielomian::operator=(Wielomian&& w) {
    swap(n,w.n);
    swap(a, w.a);
    return *this;
}

istream& operator >> (istream &we, Wielomian &w)
{
    we>>w.n;
    for(int i=w.n;i>=0;i--)
    {
        double wsp;
        we>>wsp;
        if(i==w.n && wsp==0 && w.n!=0) throw invalid_argument("Współczynnik przy najwyższej potędze nie może wynosić 0.");
        w.a[i]=wsp;
    }
    return we;
}

ostream& operator << (ostream &wy, const Wielomian &w)
{
    // wy<<w.n;
    for(int i=w.n;i>=0;i--)
    {
        wy<<w.a[i];
        if(i!=0)
        {
            wy<<" x^"<<i<<" + ";
        }
    }
    return wy;
}

Wielomian operator + (const Wielomian &u, const Wielomian &v)
{
    int st = max(u.n, v.n);
    Wielomian w(st);
    for(int i=0;i<=st;i++)
    {
        double uval = i<=u.n ? u.a[i] : 0.0;
        double vval = i<=v.n ? v.a[i] : 0.0;
        double res = uval+vval;
        if(i==st && res==0 && st!=0) throw invalid_argument("Współczynnik przy najwyższej potędze nie może wynosić 0.");
        w.a[i]=res;
    }
    return w;
}

Wielomian operator - (const Wielomian &u, const Wielomian &v)
{
    int st = max(u.n, v.n);
    Wielomian w(st);
    for(int i=0;i<=st;i++)
    {
        double uval = i<=u.n ? u.a[i] : 0.0;
        double vval = i<=v.n ? v.a[i] : 0.0;
        double res = uval-vval;
        if(i==st && res==0 && st!=0) throw invalid_argument("Współczynnik przy najwyższej potędze nie może wynosić 0.");
        w.a[i]=res;
    }
    return w;
}

Wielomian operator * (const Wielomian &u, const Wielomian &v)
{
    int st=u.n+v.n;
    Wielomian res(st,0.0);
    for(int i=0;i<=u.n;i++)
    {
        for(int j=0;j<=v.n;j++)
        {
            res.a[i+j]+=u.a[i]*v.a[j];
        }
    }
    return res;
}

Wielomian operator * (const Wielomian &u, double c)
{
    Wielomian res(u.n);
    for(int i=0;i<=u.n;i++)
    {
        res.a[i]=u.a[i]*c;
    }
    return res;
}

Wielomian &Wielomian::operator += (const Wielomian &v)
{
    int st = max(n, v.n);
    for(int i=0;i<=st;i++)
    {
        double uval = i<=n ? a[i] : 0.0;
        double vval = i<=v.n ? v.a[i] : 0.0;
        double res = uval+vval;
        if(i==st && res==0 && st!=0) throw invalid_argument("Współczynnik przy najwyższej potędze nie może wynosić 0.");
        a[i]=res;
    }
    return *this;
}

Wielomian &Wielomian::operator -= (const Wielomian &v)
{
    int st = max(n, v.n);
    for(int i=0;i<=st;i++)
    {
        double uval = i<=n ? a[i] : 0.0;
        double vval = i<=v.n ? v.a[i] : 0.0;
        a[i]=uval-vval;
        double res = uval-vval;
        if(i==st && res==0 && st!=0) throw invalid_argument("Współczynnik przy najwyższej potędze nie może wynosić 0.");
        a[i]=res;
    }
    return *this;
}

Wielomian &Wielomian::operator *= (const Wielomian &v)
{
    Wielomian res = (*this)*v;
    swap(res.n, n);
    swap(res.a, a);
    return *this;
}

Wielomian &Wielomian::operator *= (double c)
{
    for(int i=0;i<=n;i++)
    {
        a[i]*=c;
    }
    return *this;
}

double Wielomian::operator () (double x) const
{
    double mult=1;
    double res=0;
    for(int i=0;i<=n;i++)
    {
        res+=mult*a[i];
        mult*=x;
    }
    return res;
}

int Wielomian::stopien()
{
    return n;
}

double Wielomian::operator [] (int i) const
{
    if(i<0) throw out_of_range("Ujemny indeks");
    if(n<i) throw out_of_range("Próba odczytania nieistniejącego współczynnika wielomianu");
    return a[n-i];
}

double& Wielomian::operator [] (int i)
{
    if(i<0) throw out_of_range("Ujemny indeks");
    if(n<i) throw out_of_range("Próba zapisania nieistniejącego współczynnika wielomianu");
    return a[n-i];
}