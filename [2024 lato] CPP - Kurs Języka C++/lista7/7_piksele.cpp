#include "7_piksele.hpp"
#include <bits/stdc++.h>
using namespace std;

Kolor::Kolor(unsigned short r, unsigned short g, unsigned short b)
{
    if(r>255 || g>255 || b>255) throw out_of_range("Barwa musi mieć wartość z zakresu 0...255");
    this->r=r;
    this->g=g;
    this->b=b;
}

unsigned short Kolor::getR() const
{
    return r;
}

unsigned short Kolor::getG() const
{
    return g;
}

unsigned short Kolor::getB() const
{
    return b;
}

void Kolor::setR(unsigned short r)
{
    if(r>255) throw out_of_range("Barwa musi mieć wartość z zakresu 0...255");
    this->r=r;
}

void Kolor::setG(unsigned short g)
{
    if(g>255) throw out_of_range("Barwa musi mieć wartość z zakresu 0...255");
    this->g=g;
}

void Kolor::setB(unsigned short b)
{
    if(b>255) throw out_of_range("Barwa musi mieć wartość z zakresu 0...255");
    this->b=b;
}

void Kolor::rozjasnij(unsigned short proc)
{
    r=min(255, r+r*proc/100); g=min(255, g+g*proc/100); b=min(255, b+b*proc/100);
}

void Kolor::przyciemnij(unsigned short proc)
{
    r-=r*proc/100; g-=g*proc/100; b-=b*proc/100;
}

Kolor Kolor::merge(Kolor a, Kolor b)
{
    Kolor wynik = Kolor((a.getR()+b.getR())/2,(a.getG()+b.getG())/2,(a.getB()+b.getB())/2);
    return wynik;
}

Kolortransparentny::Kolortransparentny(unsigned short r, unsigned short g, unsigned short b, unsigned short a)
: Kolor(r,g,b) {
    if(a>255) throw out_of_range("Alfa musi mieć wartość z zakresu 0...255");
    this->alpha=a;
};

unsigned short Kolortransparentny::getAlpha() const
{
    return alpha;
}

void Kolortransparentny::setAlpha(unsigned short alpha)
{
    if(alpha>255) throw out_of_range("Alfa musi mieć wartość z zakresu 0...255");
    this->alpha=alpha;
}

Kolornazwany::Kolornazwany(unsigned short r, unsigned short g, unsigned short b, string name) : Kolor(r,g,b)
{
    for(int i=0;i<name.length();i++)
    {
        if((int)name[i]<97 || (int)name[i]>122)
        {
            throw invalid_argument("Nazwa koloru może składać się wyłącznie z małych liter alfabetu angielskiego");
        }
    }
    this->name=name;
}

string Kolornazwany::getName() const
{
    return name;
}

void Kolornazwany::setName(string name)
{
    for(int i=0;i<name.length();i++)
    {
        if((int)name[i]<97 || (int)name[i]>122)
        {
            throw invalid_argument("Nazwa koloru może składać się wyłącznie z małych liter alfabetu angielskiego");
        }
    }
    this->name=name;
}

Kolortn::Kolortn(unsigned short r, unsigned short g, unsigned short b, unsigned short alpha, string name)
: Kolor(r,g,b), Kolortransparentny(r,g,b,alpha), Kolornazwany(r,g,b,name)
{
    
}

Piksel::Piksel(int x, int y)
{
    if(x<0 || x>Piksel::MAX_X || y<0 || y>Piksel::MAX_Y) throw out_of_range("Współrzędne piksela są poza ekranem");
    this->x=x;
    this->y=y;
}

int Piksel::getX() const
{
    return x;
}

int Piksel::getY() const
{
    return y;
}

void Piksel::setX(int x)
{
    if(x<0 || x>Piksel::MAX_X) throw out_of_range("Współrzędne piksela są poza ekranem");
    this->x=x;
}

void Piksel::setY(int y)
{
    if(y<0 || y>Piksel::MAX_Y) throw out_of_range("Współrzędne piksela są poza ekranem");
    this->y=y;
}

int Piksel::distFromLeft()
{
    return x;
}

int Piksel::distFromRight()
{
    return Piksel::MAX_X-x;
}

int Piksel::distFromUp()
{
    return Piksel::MAX_Y-y;
}

int Piksel::distFromDown()
{
    return y;
}

int Piksel::dist(const Piksel &a, const Piksel &b)
{
    int dist_x=a.getX()-b.getX();
    int dist_y=a.getY()-b.getY();
    return sqrt(dist_x*dist_x+dist_y*dist_y);
}

int Piksel::dist(const Piksel *a, const Piksel *b)
{
    int dist_x=a->getX()-b->getX();
    int dist_y=a->getY()-b->getY();
    return sqrt(dist_x*dist_x+dist_y*dist_y);
}

Pikselkolorowy::Pikselkolorowy(int x, int y, Kolor k) : Piksel(x,y)
{
    kolor=k;
}

void Pikselkolorowy::move(int x, int y)
{
    if(this->x+x<0 || this->x+x>Piksel::MAX_X || this->y+y<0 || this->y+y>Piksel::MAX_Y)
        throw out_of_range("Przesunięto piksel poza ekran");
    this->x+=x;
    this->y+=y;
}

ostream& operator << (ostream &wy, const Kolor &k)
{
    // wy<<k.r<<" "<<k.g<<" "<<k.b;
    wy<<"\033[38;2;"<<k.r<<";"<<k.g<<";"<<k.b<<"m█\033[0m";
    return wy;
}

ostream& operator << (ostream &wy, const Kolortransparentny &k)
{
    // wy<<k.r<<" "<<k.g<<" "<<k.b;
    wy<<"\033[38;2;"<<k.getR()<<";"<<k.getG()<<";"<<k.getB()<<"mTransperentny, alpha="<<k.getAlpha()<<"\033[0m";
    return wy;
}

ostream& operator << (ostream &wy, const Kolornazwany &k)
{
    // wy<<k.r<<" "<<k.g<<" "<<k.b;
    wy<<"\033[38;2;"<<k.getR()<<";"<<k.getG()<<";"<<k.getB()<<"m"<<k.getName()<<"\033[0m";
    return wy;
}

ostream& operator << (ostream &wy, const Kolortn &k)
{
    // wy<<k.r<<" "<<k.g<<" "<<k.b;
    wy<<"\033[38;2;"<<k.getR()<<";"<<k.getG()<<";"<<k.getB()<<"m"<<k.getName()<<", alpha="<<k.getAlpha()<<"\033[0m";
    return wy;
}

ostream& operator << (ostream &wy, const Piksel &k)
{
    // wy<<k.r<<" "<<k.g<<" "<<k.b;
    wy<<"X="<<k.getX()<<", Y="<<k.getY();
    return wy;
}

ostream& operator << (ostream &wy, const Pikselkolorowy &k)
{
    // wy<<k.r<<" "<<k.g<<" "<<k.b;
    wy<<"\033[38;2;"<<k.kolor.getR()<<";"<<k.kolor.getG()<<";"<<k.kolor.getB()<<"m"<<"X="<<k.getX()<<", Y="<<k.getY()<<"\033[0m";
    return wy;
}