#include "8_wyrazenie.hpp"
#include <bits/stdc++.h>
using namespace std;

int main()
{
    Liczba l1(2);
    Liczba l2(5);
    Dodawanie d(&l1, &l2);
    cout<<d.oblicz()<<"\n";
    cout<<d.zapis()<<"\n";
    Odejmowanie o(&l1, &l2);
    cout<<o.oblicz()<<"\n";
    cout<<o.zapis()<<"\n";
    Mnozenie m(&l1, &l2);
    cout<<m.oblicz()<<"\n";
    cout<<m.zapis()<<"\n";
    Dzielenie div(&l1, &l2);
    cout<<div.oblicz()<<"\n";
    cout<<div.zapis()<<"\n";
    Mnozenie zlozona(&d,&o);
    cout<<zlozona.oblicz()<<"\n";
    cout<<zlozona.zapis()<<"\n";
    Potegowanie pow(&d,&o);
    cout<<pow.oblicz()<<"\n";
    cout<<pow.zapis()<<"\n";
    Modulo mod(new Liczba(7), new Liczba(2));
    cout<<mod.oblicz()<<"\n";
    cout<<mod.zapis()<<"\n";
    Logarytm log(new Liczba(2), new Liczba(10));
    cout<<log.oblicz()<<"\n";
    cout<<log.zapis()<<"\n";

    Zmienna::dodajZmienna("x", 7);
    Zmienna::dodajZmienna("y", 2);

    Wyrazenie *w1 = new Dzielenie(
        new Mnozenie(
            new Odejmowanie(
                new Zmienna("x"),
                new Liczba(1)
            ),
            new Zmienna("x")
        ),
        new Liczba(2)
    );
    cout<<w1->zapis()<<"\n";
    cout<<w1->oblicz()<<"\n";
    Wyrazenie *w2 = new Dzielenie(
        new Dodawanie(
            new Liczba(3),
            new Liczba(5)
        ),
        new Dodawanie(
            new Liczba(2),
            new Mnozenie(
                new Zmienna("x"),
                new Liczba(7)
            )
        )
    );
    cout<<w2->zapis()<<"\n";
    cout<<w2->oblicz()<<"\n";
    Wyrazenie *w3 = new Odejmowanie(
        new Dodawanie(
            new Liczba(2),
            new Mnozenie(
                new Zmienna("x"),
                new Liczba(7)
            )
        ),
        new Dodawanie(
            new Mnozenie(
                new Zmienna("y"),
                new Liczba(3)
            ),
            new Liczba(5)
        )
    );
    cout<<w3->zapis()<<"\n";
    cout<<w3->oblicz()<<"\n";
    Wyrazenie *w4 = new Dzielenie(
        new Cosinus(
            new Mnozenie(
                new Dodawanie(
                    new Zmienna("x"),
                    new Liczba(1)
                ),
                new Stala("pi", M_PI)
            )
        ),
        new Potegowanie(
            new Stala("e", M_E),
            new Potegowanie(
                new Zmienna("x"),
                new Liczba(2)
            )
        )
    );
    cout<<w4->zapis()<<"\n";
    cout<<w4->oblicz()<<"\n";
    return 0;
}