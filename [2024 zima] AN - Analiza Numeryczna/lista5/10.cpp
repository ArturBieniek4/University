#include <bits/stdc++.h>

using namespace std;

double rzad4(double x0, double x1, double x2, double x3)
{
    // return abs(log(abs((x3-x2)/(x2-x1)))/log(abs((x2-x1)/(x1-x0))));
    return log(x3/x2)/log(x2/x1);
}

double estimate_c(double p, double xn, double xn1)
{
    return xn1/pow(xn, p);
}

double weeks(double p, double c, double e)
{
    int w=0;
    while(e > pow(10, -100))
    {
        //e=c*en-1^p
        e = pow(e, p)*c;
        w++;
    }
    return w;
}

int main()
{
    double p_ch=rzad4(0.763907023, 0.543852762, 0.196247370, 0.009220859);
    double c_ch=estimate_c(p_ch, 0.763907023, 0.543852762);
    double w_ch=weeks(p_ch, c_ch, 0.009220859);
    cout<<p_ch<<" "<<c_ch<<" "<<w_ch<<"\n";

    double p_a=rzad4(0.605426053, 0.055322784, 0.004819076, 0.000399783);
    double c_a=estimate_c(p_a, 0.605426053, 0.055322784);
    double w_a=weeks(p_a, c_a, 0.000399783);
    cout<<p_a<<" "<<c_a<<" "<<w_a<<"\n";
    return 0;
}