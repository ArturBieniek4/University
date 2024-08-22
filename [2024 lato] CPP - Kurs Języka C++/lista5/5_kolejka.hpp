#ifndef KOLEJKA_HPP
#define KOLEJKA_HPP
#include <string>

using namespace std;

class Kolejka
{
    int pojemnosc, poczatek=0, ile=0;
    string *tab;
    public:
        Kolejka(int length);
        Kolejka();
        Kolejka(initializer_list<string> init);
        Kolejka(const Kolejka& l);
        Kolejka(Kolejka&& l);
        ~Kolejka();
        const Kolejka& operator=(const Kolejka& l);
        const Kolejka& operator=(Kolejka&& l);
        void wstaw(string str);
        string usun();
        string zprzodu();
        int dlugosc();
};
#endif