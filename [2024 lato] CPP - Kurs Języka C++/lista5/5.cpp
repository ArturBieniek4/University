#include "5_kolejka.hpp"
#include <bits/stdc++.h>
using namespace std;

int main()
{
    Kolejka k2=Kolejka(initializer_list<string> {"ala", "ma", "kota"});
    // Kolejka k1=k2;
    Kolejka k1=move(k2);
    cout<<k1.dlugosc()<<"\n";
    cout<<k1.zprzodu()<<"\n";
    cout<<k1.usun()<<"\n";
    cout<<k1.usun()<<"\n";
    cout<<k1.usun()<<"\n";
    // cout<<k1.zprzodu()<<"\n";
    k1.wstaw("test");
    cout<<k1.zprzodu()<<"\n";
    return 0;
}