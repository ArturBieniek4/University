#include "9_wymierna.hpp"
#include <bits/stdc++.h>
using namespace std;
using namespace obliczenia;
Wymierna::Wymierna(int l, int m)
{
    if(m==0) throw dzielenie_przez_0();
    licz = l;
    mian = m;
    uprosc();
}

void Wymierna::uprosc() noexcept
{
    int wspolny = __gcd(licz, mian);
    licz/=wspolny;
    mian/=wspolny;
    if(mian<0)
    {
        mian=-mian;
        licz=-licz;
    }
}

int Wymierna::wspolny(int mian1, int mian2)
{
    int gcd = __gcd(mian1, mian2);
    mian1/=gcd;
    int wynik = mian1*mian2;
    if(wynik/mian1!=mian2) throw przekroczenie_zakresu();
    return wynik;
}

Wymierna operator + (const Wymierna &u, const Wymierna &v)
{
    int wsp = Wymierna::wspolny(u.getMian(), v.getMian());
    int mnoz_u = wsp/u.getMian();
    int mnoz_v = wsp/v.getMian();
    int u_licz = u.getLicz() * mnoz_u;
    int v_licz = v.getLicz() * mnoz_v;
    if(u_licz / mnoz_u != u.getLicz() || v_licz / mnoz_v != v.getLicz())
        throw przekroczenie_zakresu();
    if(u_licz > 0 && v_licz > INT_MAX - u_licz
        || u_licz <0 && v_licz < INT_MIN - u_licz)
        throw przekroczenie_zakresu();
    Wymierna w(u_licz+v_licz, wsp);
    w.uprosc();
    return w;
}

Wymierna operator - (const Wymierna &u, const Wymierna &v)
{
    int wsp = Wymierna::wspolny(u.getMian(), v.getMian());
    int mnoz_u = wsp/u.getMian();
    int mnoz_v = wsp/v.getMian();
    int u_licz = u.getLicz() * mnoz_u;
    int v_licz = v.getLicz() * mnoz_v;
    if(u_licz / mnoz_u != u.getLicz() || v_licz / mnoz_v != v.getLicz())
        throw przekroczenie_zakresu();
    if(u_licz < 0 && v_licz > INT_MAX - u_licz
        || u_licz > 0 && v_licz < INT_MIN - u_licz)
        throw przekroczenie_zakresu();
    Wymierna w(u_licz-v_licz, wsp);
    w.uprosc();
    return w;
}

Wymierna operator * (const Wymierna &u, const Wymierna &v)
{
    int licz = u.getLicz() * v.getLicz();
    int mian = u.getMian() * v.getMian();
    if(licz/u.getLicz()!=v.getLicz() || mian/u.getMian()!=v.getMian())
        throw przekroczenie_zakresu();
    Wymierna w(licz, mian);
    w.uprosc();
    return w;
}

Wymierna operator / (const Wymierna &u, const Wymierna &v)
{
    if(v.getLicz()==0) throw dzielenie_przez_0();
    int licz = u.getLicz() * v.getMian();
    int mian = u.getMian() * v.getLicz();
    if(licz/u.getLicz()!=v.getMian() || mian/u.getMian()!=v.getLicz())
        throw przekroczenie_zakresu();
    Wymierna w(licz, mian);
    w.uprosc();
    return w;
}

Wymierna &Wymierna::operator += (const Wymierna &v)
{
    int wsp = Wymierna::wspolny(mian, v.mian);
    int mnoz_u = wsp/mian;
    int mnoz_v = wsp/v.mian;
    int u_licz = licz * mnoz_u;
    int v_licz = v.licz * mnoz_v;
    if(u_licz / mnoz_u != licz || v_licz / mnoz_v != v.licz)
        throw przekroczenie_zakresu();
    if(u_licz > 0 && v_licz > INT_MAX - u_licz
        || u_licz < 0 && v_licz < INT_MIN - u_licz)
        throw przekroczenie_zakresu();
    licz=u_licz+v_licz;
    mian=wsp;
    uprosc();
    return *this;
}

Wymierna &Wymierna::operator -= (const Wymierna &v)
{
    int wsp = Wymierna::wspolny(mian, v.mian);
    int mnoz_u = wsp/mian;
    int mnoz_v = wsp/v.mian;
    int u_licz = licz * mnoz_u;
    int v_licz = v.licz * mnoz_v;
    licz=u_licz-v_licz;
    mian=wsp;
    uprosc();
    return *this;
}

Wymierna &Wymierna::operator *= (const Wymierna &v)
{
    int l = licz * v.licz;
    int m = mian * v.mian;
    if(l/licz!=v.licz || m/mian!=v.mian)
        throw przekroczenie_zakresu();
    licz=l;
    mian=m;
    uprosc();
    return *this;
}

Wymierna &Wymierna::operator /= (const Wymierna &v)
{
    if(v.licz==0) throw dzielenie_przez_0();
    int l = licz * v.mian;
    int m = mian * v.licz;
    if(l/licz!=v.mian || m/mian!=v.licz)
        throw przekroczenie_zakresu();
    licz=l;
    mian=m;
    uprosc();
    return *this;
}

Wymierna::operator double() const noexcept
{
    return ((double)licz)/((double)mian);
}

Wymierna::operator int() const noexcept
{
    return round(((double)licz)/((double)mian));
}

bool Wymierna::is_periodic() const noexcept
{
    return mian%2!=0 && mian%5!=0;
}

ostream& operator <<(ostream &wy, const Wymierna &w)
{
    wy<<w.getLicz()/w.getMian()<<".";
    std::unordered_map<int, int> mapa;
    std::vector<int> wynik;
    
    int reszta = w.getLicz() % w.getMian();
    while (reszta != 0 && mapa.find(reszta) == mapa.end()) {
        mapa[reszta] = wynik.size();
        reszta *= 10;
        int cyfra = reszta / w.getMian();
        wynik.push_back(cyfra);
        reszta %= w.getMian();
    }
    string wynik2;
    for (int i = 0; i < wynik.size(); i++) {
        if (i == mapa[reszta]) {
            wynik2 += "(";
        }
        wynik2 += std::to_string(wynik[i]);
    }
    if (reszta != 0) {
        wynik2 += ")";
    }
    wy<<wynik2;
    return wy;
}