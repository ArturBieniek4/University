#include "6_wielomian.hpp"
#include <bits/stdc++.h>
using namespace std;

int main()
{
    // Wielomian k2=Wielomian(initializer_list<double> {1,2,3});
    double arg[3]={1,2,3};
    Wielomian k2=Wielomian(2, arg);
    // Wielomian k2=Wielomian();
    // Wielomian k1=k2;
    // Wielomian k1=move(k2);
    Wielomian k3;
    cin>>k3;
    k3+=k3;
    cout<<k3<<"\n";
    cout<<k2<<"\n";
    cout<<k2+k3<<"\n";
    cout<<k2-k3<<"\n";
    cout<<k2*k2<<"\n";
    cout<<k2*10<<"\n";
    // k3-=k3;
    cout<<k2(7)<<"\n";
    cout<<k2[0]<<" "<<k2[1]<<" "<<k2[2]<<"\n";
    k2[0]=8;
    cout<<k2[0]<<" "<<k2[1]<<" "<<k2[2]<<"\n";
    cout<<k2<<"\n";
    k2*=k2;
    // k2=k2*10;
    cout<<k2<<"\n";
    
    return 0;
}