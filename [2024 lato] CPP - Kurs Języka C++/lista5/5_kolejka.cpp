#include "5_kolejka.hpp"
#include <bits/stdc++.h>
using namespace std;

Kolejka::Kolejka(int length)
{
    tab = new string[length];
    pojemnosc = length;
}

Kolejka::Kolejka() : Kolejka(1) {}

Kolejka::Kolejka(initializer_list<string> init)
: Kolejka(init.size())
{
    for(auto &s:init)
    {
        wstaw(s);
    }
}

Kolejka::Kolejka(const Kolejka& kol) : Kolejka(kol.pojemnosc)
{
    ile=kol.ile;
    poczatek=kol.poczatek;
    for(int i=0;i<kol.pojemnosc;i++)
    {
        tab[i]=kol.tab[i];
    }
}

Kolejka::Kolejka(Kolejka&& kol) : Kolejka()
{
    swap(tab,kol.tab);
    swap(poczatek, kol.poczatek);
    swap(ile, kol.ile);
    swap(pojemnosc, kol.pojemnosc);
}

Kolejka::~Kolejka()
{
    delete[] tab;
}

const Kolejka &Kolejka::operator=(const Kolejka& kol) {
    if(&kol==this) return *this;
    this->~Kolejka();
    this->pojemnosc=kol.pojemnosc;
    this->ile=kol.ile;
    this->poczatek=kol.poczatek;
    this->tab = new string[this->pojemnosc];
    for(int i=0;i<kol.pojemnosc;i++)
    {
        tab[i]=kol.tab[i];
    }
    return *this;
}

const Kolejka &Kolejka::operator=(Kolejka&& kol) {
    swap(tab,kol.tab);
    swap(poczatek, kol.poczatek);
    swap(ile, kol.ile);
    swap(pojemnosc, kol.pojemnosc);
    return *this;
}

void Kolejka::wstaw(string str)
{
    if(dlugosc()==pojemnosc)
    {
        throw out_of_range("queue overflow");
    }
    else
    {
        tab[(poczatek+ile++)%pojemnosc] = str;
    }
}

string Kolejka::zprzodu()
{
    if(ile==0) throw out_of_range("Peek on empty queue");
    return tab[poczatek];
}

string Kolejka::usun()
{
    if(ile==0) throw out_of_range("Pop on empty queue");
    string &res = tab[poczatek];
    poczatek=(poczatek+1)%pojemnosc;
    ile--;
    return res;
}

int Kolejka::dlugosc()
{
    return ile;
}