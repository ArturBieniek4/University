#include "8_wyrazenie.hpp"
#include <bits/stdc++.h>
using namespace std;

vector<std::pair<std::string, double>> Zmienna::zmienne;

template<typename Base, typename T>
inline bool instanceof(const T *ptr) {
   return dynamic_cast<const Base*>(ptr) != nullptr;
}

void Zmienna::dodajZmienna(const std::string& nazwa, double wartosc)
{
    for(int i=0;i<zmienne.size();i++)
    {
        if(zmienne[i].first==nazwa)
        {
            throw runtime_error("Zmienna "+nazwa+" jest już dodana!");
        }
    }
    zmienne.push_back(make_pair(nazwa, wartosc));
}

void Zmienna::usunZmienna(const std::string& nazwa)
{
    for(int i=0;i<zmienne.size();i++)
    {
        if(zmienne[i].first==nazwa)
        {
            zmienne.erase(zmienne.begin()+i);
            return;
        }
    }
    throw runtime_error("Nie znaleziono zmiennej "+nazwa);
}

void Zmienna::zmienWartoscZmiennej(const std::string& nazwa, double wartosc)
{
    for(int i=0;i<zmienne.size();i++)
    {
        if(zmienne[i].first==nazwa)
        {
            zmienne[i].second=wartosc;
            return;
        }
    }
    throw runtime_error("Nie znaleziono zmiennej "+nazwa);
}

double Zmienna::oblicz() const
{
    for(int i=0;i<zmienne.size();i++)
    {
        if(zmienne[i].first==nazwa)
        {
            return zmienne[i].second;
        }
    }
    throw runtime_error("Nie znaleziono zmiennej "+nazwa);
}

Liczba::Liczba(double wartosc)
{
    this->wartosc=wartosc;
}

string Liczba::zapis() const
{
    stringstream ss;
    ss<<wartosc;
    return ss.str();
}

double Dodawanie::oblicz() const
{
    return arg1->oblicz()+arg2->oblicz();
}

string Dodawanie::zapis() const
{
    return arg1->zapis()+"+"+arg2->zapis();
}

double Odejmowanie::oblicz() const
{
    return arg1->oblicz()-arg2->oblicz();
}

string Odejmowanie::zapis() const
{
    return arg1->zapisNawiasuj()+"-"+arg2->zapisNawiasuj();
}

double Mnozenie::oblicz() const
{
    return arg1->oblicz()*arg2->oblicz();
}

string Wyrazenie::zapisNawiasuj() const
{
    string res=zapis();
    if(instanceof<Dodawanie>(this) || instanceof<Odejmowanie>(this))
        res="("+res+")";
    return res;
}

string Mnozenie::zapis() const
{
    return arg1->zapisNawiasuj()+"*"+arg2->zapisNawiasuj();
}

double Dzielenie::oblicz() const
{
    double divisor = arg2->oblicz();
    if(divisor==0) throw domain_error("Dzielenie przez 0!") ;
    return arg1->oblicz()/divisor;
}

string Dzielenie::zapis() const
{
    return arg1->zapisNawiasuj()+"/"+arg2->zapisNawiasuj();
}

double Potegowanie::oblicz() const
{
    return pow(arg1->oblicz(),arg2->oblicz());
}

string Potegowanie::zapis() const
{
    return arg1->zapisNawiasuj()+"^"+arg2->zapisNawiasuj();
}

double Logarytm::oblicz() const
{
    return log(arg2->oblicz())/log(arg1->oblicz());
}

string Logarytm::zapis() const
{
    return "log "+arg1->zapisNawiasuj()+" "+arg2->zapisNawiasuj();
}

double Modulo::oblicz() const
{
    double divisor = arg2->oblicz();
    if(divisor==0) throw domain_error("Dzielenie przez 0!") ;
    return fmod(arg1->oblicz(), divisor);
}

string Modulo::zapis() const
{
    return arg1->zapisNawiasuj()+"%"+arg2->zapisNawiasuj();
}

double Sinus::oblicz() const
{
    return sin(arg->oblicz());
}

string Sinus::zapis() const
{
    return "sin("+arg->zapis()+")";
}

double Cosinus::oblicz() const
{
    return cos(arg->oblicz());
}

string Cosinus::zapis() const
{
    return "cos("+arg->zapis()+")";
}

double Eksponencjalna::oblicz() const
{
    return exp(arg->oblicz());
}

string Eksponencjalna::zapis() const
{
    return "exp("+arg->zapis()+")";
}

double LogarytmNaturalny::oblicz() const
{
    return log(arg->oblicz());
}

string LogarytmNaturalny::zapis() const
{
    return "ln("+arg->zapis()+")";
}

double Bezwzgl::oblicz() const
{
    return abs(arg->oblicz());
}

string Bezwzgl::zapis() const
{
    return "|"+arg->zapis()+"|";
}

double Przeciw::oblicz() const
{
    return -(arg->oblicz());
}

string Przeciw::zapis() const
{
    return "-"+arg->zapisNawiasuj();
}

double Odwrot::oblicz() const
{
    double wynik = arg->oblicz();
    if(wynik==0) throw domain_error("Dzielenie przez 0!") ;
    return 1/wynik;
}

string Odwrot::zapis() const
{
    return "1/"+arg->zapisNawiasuj();
}

OperatorJednoarg::~OperatorJednoarg()
{
    delete arg;
    arg=nullptr;
}

OperatorDwuarg::~OperatorDwuarg()
{
    delete arg1;
    arg1=nullptr;
    delete arg2;
    arg2=nullptr;
}