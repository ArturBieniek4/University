#include <bits/stdc++.h>

using namespace std;

double simple(double x, double y)
{
    return sqrt(x*x+y*y);
}

double advanced(double x, double y)
{
    double m = max(abs(x),abs(y));
    x=x/m;
    y=y/m;
    return m*sqrt(x+y);
}

double multi(vector<double> v)
{
    double m = v[0];
    for(int i=0; i<v.size(); i++)
    {
        m=max(m, abs(v[i]));
    }
    double suma=0;
    for(int i=0; i<v.size(); i++)
    {
        suma+=v[i]/m;
    }
    return m*sqrt(suma);
}

int main()
{
    cout<<simple(pow(10, 160), pow(10, 160))<<"\n";
    cout<<advanced(pow(10, 160), pow(10, 160))<<"\n";
    cout<<multi(vector<double>{pow(10, 160), pow(10, 160)})<<"\n";
    cout<<multi(vector<double>{pow(10, 160), pow(10, 160), pow(10, 160)})<<"\n";
    return 0;
}