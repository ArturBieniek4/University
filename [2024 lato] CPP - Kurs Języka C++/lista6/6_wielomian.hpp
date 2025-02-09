#ifndef WIELOMIAN_HPP
#define WIELOMIAN_HPP
#include <string>

using namespace std;

class Wielomian
{
    int n; // stopień
    double *a; // współczynniki
    public:
        Wielomian(int st=0, double wsp=1.0);
        Wielomian(int st, const double wsp[]);
        Wielomian(initializer_list<double> wsp);
        Wielomian(const Wielomian& l);
        Wielomian(Wielomian&& l);
        const Wielomian& operator=(const Wielomian& w);
        const Wielomian& operator=(Wielomian&& w);
        ~Wielomian();
        friend istream& operator >> (istream &we, Wielomian &w);
        friend ostream& operator << (ostream &wy, const Wielomian &w);
        friend Wielomian operator + (const Wielomian &u, const Wielomian &v);
        friend Wielomian operator - (const Wielomian &u, const Wielomian &v);
        friend Wielomian operator * (const Wielomian &u, const Wielomian &v);
        friend Wielomian operator * (const Wielomian &u, double c);
        Wielomian& operator += (const Wielomian &v);
        Wielomian& operator -= (const Wielomian &v);
        Wielomian& operator *= (const Wielomian &v);
        Wielomian& operator *= (double c);
        double operator () (double x) const; // wartość Wielomianianu dla x
        double operator [] (int i) const; // do odczytu współczynnika
        double& operator [] (int i); // do zapisu współczynnika
        int stopien();
};
#endif