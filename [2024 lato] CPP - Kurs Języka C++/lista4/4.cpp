#include <bits/stdc++.h>
#include "4_liczba.hpp"

using namespace std;

int main()
{
    Liczba l(5);
    l.nextValue(3);
    cout<<l.getValue()<<"\n";
    l.prevValue();
    cout<<l.getValue()<<"\n";
    l.prevValue();
    cout<<l.getValue()<<"\n";
    Liczba l2=l;
    Liczba l3=move(l);
    cout<<l2.getValue()<<"\n";
    cout<<l3.getValue()<<"\n";
    l3.prevValue();
    l2.prevValue();
    // cout<<l2.getValue()<<"\n";
    // l2.prevValue();
    // cout<<l2.getValue()<<"\n";
    l2.nextValue(11);
    l2.nextValue(111);
    l2.nextValue(1111);
    return 0;
}