#include <iostream>
#include <math.h>

using namespace std;

pair<double, double> easy(double a, double b, double c)
{
    double delta = b*b-4*a*c;
    cout<<"delta="<<delta<<"\n";
    double x1=(-b-sqrt(delta))/2*a;
    double x2=(-b+sqrt(delta))/2*a;
    return make_pair(x1, x2);
}

pair<double, double> advanced(double a, double b, double c)
{
    double delta = b*b-4*a*c;
    double x1=(-b-sqrt(delta))/2*a;
    double x2=(-b+sqrt(delta))/2*a;
    if(abs(x1)>abs(x2))
    {
        x2=c/a/x1;
    }
    else x1=c/a/x2;
    return make_pair(x1, x2);
}

int main()
{
    pair<double, double> easysol=easy(-1, pow(-10, 10), 4);
    cout<<easysol.first<<" "<<easysol.second<<"\n";
    pair<double, double> advsol=advanced(-1, pow(-10, 10), 4);
    cout<<advsol.first<<" "<<advsol.second<<"\n";
    return 0;
}