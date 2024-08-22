#ifndef PIKSELE_HPP
#define PIKSELE_HPP
#include <bits/stdc++.h>

using namespace std;

class Kolor
{
    unsigned short r,g,b;
    public:
        Kolor() : Kolor(0,0,0) {};
        Kolor(unsigned short r, unsigned short g, unsigned short b);
        unsigned short getR() const;
        unsigned short getG() const;
        unsigned short getB() const;
        void setR(unsigned short r);
        void setG(unsigned short r);
        void setB(unsigned short r);
        void rozjasnij(unsigned short proc);
        void przyciemnij(unsigned short proc);
        static Kolor merge(Kolor a, Kolor b);
        friend ostream& operator << (ostream &wy, const Kolor &k);
};

class Kolortransparentny : virtual public Kolor{
    // tu było napisane najpierw że ma dziedziczyć niepublicznie, a kawałek dalej że publicznie
    unsigned short alpha;
    public:
        Kolortransparentny(unsigned short r=0, unsigned short g=0, unsigned short b=0, unsigned short a=255);
        unsigned short getAlpha() const;
        void setAlpha(unsigned short);
        friend ostream& operator << (ostream &wy, const Kolortransparentny &k);
};

class Kolornazwany : virtual public Kolor{
    string name;
    public:
        Kolornazwany(unsigned short r=0, unsigned short g=0, unsigned short b=0, string name="");
        string getName() const;
        void setName(string);
        friend ostream& operator << (ostream &wy, const Kolornazwany &k);
};

class Kolortn : virtual public Kolor, virtual public Kolortransparentny, virtual public Kolornazwany
{
    public:
        Kolortn(unsigned short r=0, unsigned short g=0, unsigned short b=0, unsigned short alpha=255, string name="");
        friend ostream& operator << (ostream &wy, const Kolortn &k);
};
class Piksel
{
    protected:
        int x, y;
        const static int MAX_X=1920;
        const static int MAX_Y=1080;
    public:
        Piksel(int x, int y);
        int getX() const;
        int getY() const;
        void setX(int x);
        void setY(int y);
        int distFromLeft();
        int distFromRight();
        int distFromUp();
        int distFromDown();
        static int dist(const Piksel &a, const Piksel &b);
        static int dist(const Piksel *a, const Piksel *b);
        friend ostream& operator << (ostream &wy, const Piksel &k);
};

class Pikselkolorowy : public Piksel
{
    Kolor kolor;
    public:
        Pikselkolorowy(int x, int y, Kolor k);
        void move(int x, int y);
        friend ostream& operator << (ostream &wy, const Pikselkolorowy &k);
};

#endif