#ifndef WYMIERNA_HPP
#define WYMIERNA_HPP
#include <bits/stdc++.h>

using namespace std;
namespace obliczenia
{
    class wyjatek_wymierny : logic_error
    {
        public:
            wyjatek_wymierny(const string &message) : logic_error(message) {};
    };

    class przekroczenie_zakresu : wyjatek_wymierny
    {
        public:
            przekroczenie_zakresu() : wyjatek_wymierny("Przekroczenie zakresu") {};
    };

    class dzielenie_przez_0 : wyjatek_wymierny
    {
        public:
            dzielenie_przez_0() : wyjatek_wymierny("Dzielenie przez 0") {};
    };

    class Wymierna
    {
        private:
            int licz, mian;
        public:
            Wymierna(int l, int m);
            Wymierna(int x) noexcept : Wymierna(x, 1) {};
            Wymierna() noexcept : Wymierna(0, 1) {};
            int getLicz() const noexcept {return licz;};
            int getMian() const noexcept {return mian;};
            friend Wymierna operator + (const Wymierna &u, const Wymierna &v);
            friend Wymierna operator - (const Wymierna &u, const Wymierna &v);
            friend Wymierna operator * (const Wymierna &u, const Wymierna &v);
            friend Wymierna operator / (const Wymierna &u, const Wymierna &v);
            Wymierna& operator += (const Wymierna &v);
            Wymierna& operator -= (const Wymierna &v);
            Wymierna& operator *= (const Wymierna &v);
            Wymierna& operator /= (const Wymierna &v);
            operator double() const noexcept;
            explicit operator int() const noexcept;
            void uprosc () noexcept;
            bool is_periodic() const noexcept;
            static int wspolny(int mian1, int mian2);
    };
}

ostream& operator << (ostream &wy, const obliczenia::Wymierna &w);

#endif