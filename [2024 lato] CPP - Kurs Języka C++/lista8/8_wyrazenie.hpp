#ifndef WYRAZENIE_HPP
#define WYRAZENIE_HPP
#include <bits/stdc++.h>

using namespace std;

class Wyrazenie
{
    protected:
        Wyrazenie() {}
    public:
        virtual double oblicz() const = 0;
        virtual string zapis() const = 0;
        virtual ~Wyrazenie() {}
        string zapisNawiasuj() const;
        // zablokowanie kopiowania i przenoszenia
        Wyrazenie(const Wyrazenie&) = delete;
        Wyrazenie(Wyrazenie&&) = delete;
        Wyrazenie& operator=(const Wyrazenie&) = delete;
        Wyrazenie& operator=(Wyrazenie&&) = delete;
};

class Operand : virtual public Wyrazenie
{

};

class Liczba : public Operand {
private:
    double wartosc;
public:
    Liczba(double wartosc);
    double oblicz() const override { return wartosc; }
    string zapis() const override;
};

class Zmienna : public Operand {
private:
    static vector<pair<string, double>> zmienne;
    string nazwa;
public:
    Zmienna(const string& nazwa) : nazwa(nazwa) {}
    double oblicz() const override;
    string zapis() const override { return nazwa; }
    static void dodajZmienna(const string& nazwa, double wartosc);
    static void usunZmienna(const string& nazwa);
    static void zmienWartoscZmiennej(const string& nazwa, double nowaWartosc);
};

class Stala : public Operand {
private:
    string nazwa;
    double wartosc;
public:
    Stala(const string& nazwa, double wartosc) : nazwa(nazwa), wartosc(wartosc) {}
    double oblicz() const override { return wartosc; }
    string zapis() const override { return nazwa; }
};

class Operator : public Wyrazenie {};

class OperatorJednoarg : public Operator {
    protected:
        Wyrazenie *arg;
    public:
        OperatorJednoarg(Wyrazenie *w) : arg(w) {}
        virtual ~OperatorJednoarg();
};

class OperatorDwuarg : public Operator {
    protected:
        Wyrazenie *arg1, *arg2;
    public:
        OperatorDwuarg(Wyrazenie *w1, Wyrazenie *w2) : arg1(w1), arg2(w2) {}
        virtual ~OperatorDwuarg();
};

class Dodawanie : public OperatorDwuarg {
    public:
        Dodawanie(Wyrazenie *w1, Wyrazenie *w2) : OperatorDwuarg(w1, w2) {}
        double oblicz() const override;
        string zapis() const override;
};

class Odejmowanie : public OperatorDwuarg {
    public:
        Odejmowanie(Wyrazenie *w1, Wyrazenie *w2) : OperatorDwuarg(w1, w2) {}
        double oblicz() const override;
        string zapis() const override;
};

class Mnozenie : public OperatorDwuarg {
    public:
        Mnozenie(Wyrazenie *w1, Wyrazenie *w2) : OperatorDwuarg(w1, w2) {}
        double oblicz() const override;
        string zapis() const override;
};

class Dzielenie : public OperatorDwuarg {
    public:
        Dzielenie(Wyrazenie *w1, Wyrazenie *w2) : OperatorDwuarg(w1, w2) {}
        double oblicz() const override;
        string zapis() const override;
};

class Potegowanie : public OperatorDwuarg {
    public:
        Potegowanie(Wyrazenie *w1, Wyrazenie *w2) : OperatorDwuarg(w1, w2) {}
        double oblicz() const override;
        string zapis() const override;
};

class Logarytm : public OperatorDwuarg {
    public:
        Logarytm(Wyrazenie *w1, Wyrazenie *w2) : OperatorDwuarg(w1, w2) {}
        double oblicz() const override;
        string zapis() const override;
};

class Modulo : public OperatorDwuarg {
    public:
        Modulo(Wyrazenie *w1, Wyrazenie *w2) : OperatorDwuarg(w1, w2) {}
        double oblicz() const override;
        string zapis() const override;
};

class Sinus : public OperatorJednoarg {
    public:
        Sinus(Wyrazenie *w) : OperatorJednoarg(w) {}
        double oblicz() const override;
        string zapis() const override;
};

class Cosinus : public OperatorJednoarg {
    public:
        Cosinus(Wyrazenie *w) : OperatorJednoarg(w) {}
        double oblicz() const override;
        string zapis() const override;
};

class Eksponencjalna : public OperatorJednoarg {
    public:
        Eksponencjalna(Wyrazenie *w) : OperatorJednoarg(w) {}
        double oblicz() const override;
        string zapis() const override;
};

class LogarytmNaturalny : public OperatorJednoarg {
    public:
        LogarytmNaturalny(Wyrazenie *w) : OperatorJednoarg(w) {}
        double oblicz() const override;
        string zapis() const override;
};

class Bezwzgl : public OperatorJednoarg {
    public:
        Bezwzgl(Wyrazenie *w) : OperatorJednoarg(w) {}
        double oblicz() const override;
        string zapis() const override;
};

class Przeciw : public OperatorJednoarg {
    public:
        Przeciw(Wyrazenie *w) : OperatorJednoarg(w) {}
        double oblicz() const override;
        string zapis() const override;
};

class Odwrot : public OperatorJednoarg {
    public:
        Odwrot(Wyrazenie *w) : OperatorJednoarg(w) {}
        double oblicz() const override;
        string zapis() const override;
};

#endif