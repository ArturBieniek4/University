#include <bits/stdc++.h>

using namespace std;

double newton(double x, double R, int steps)
{
    while(steps!=0)
    {
        x = 1.5 * x - 0.5 * x * x * x * R;
        steps--;
    }
    return x;
}

float magic(float y)
{
    long i  = * ( long * ) &y;						// evil floating point bit level hacking
	i  = 0x5f3759df - ( i >> 1 );               // what the fuck?
	y  = * ( float * ) &i;
    return y;
}

int main()
{
    cout<<setprecision(3000);
    cout<<newton(0.5, 7.0, 1)<<"\n";
    cout<<newton(0.5, 7.0, 2)<<"\n";
    cout<<newton(0.5, 7.0, 3)<<"\n";
    cout<<newton(0.5, 7.0, 4)<<"\n";
    cout<<newton(0.5, 7.0, 5)<<"\n";
    cout<<newton(0.5, 7.0, 6)<<"\n";
    cout<<newton(0.5, 7.0, 7)<<"\n";

    cout<<"\n";

    cout<<newton(0.3, 7.0, 4)<<"\n";
    cout<<newton(0.3, 7.0, 5)<<"\n";
    cout<<newton(0.3, 7.0, 6)<<"\n";

    cout<<"\n";

    cout<<magic(7.0)<<"\n";
    cout<<newton(magic(7.0), 7.0, 4)<<"\n";
    return 0;
}