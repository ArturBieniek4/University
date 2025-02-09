#include "9_wymierna.hpp"
#include <bits/stdc++.h>
using namespace std;

using namespace obliczenia;

int main()
{
    Wymierna w1(14,7);
    Wymierna w2(1,3);
    w1+=w2;
    w1-=w2;
    w1*=w2;
    w1/=w2;
    cout<<(w1).getLicz()<<"/"<<(w1).getMian()<<"\n";
    cout<<w1<<"\n";
    cout<<w2<<"\n";
    Wymierna w3(2,3);
    cout<<w3<<"\n";
    // Wymierna w4(w3);
    // Wymierna w4 = w3;
    Wymierna w4(move(w3));
    cout<<static_cast<int>(w4)<<"\n";
    return 0;
}