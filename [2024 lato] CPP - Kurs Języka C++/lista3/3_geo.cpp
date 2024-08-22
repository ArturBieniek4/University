#include "3_geo.hpp"
#include <bits/stdc++.h>

double Punkt::getX() const
{
    return this->x;
}
double Punkt::getY() const
{
    return this->y;
}
Punkt::Punkt(double x, double y)
{
    this->x=x;
    this->y=y;
}
Punkt::Punkt(const Punkt& p)
{
    this->x=p.x;
    this->y=p.y;
}

Odcinek::Odcinek(const Odcinek& o) : a(o.a), b(o.b) {
}
Odcinek::Odcinek(const Punkt& a, const Punkt& b) : a(a), b(b) {
    if(a.getX()==b.getX() && a.getY()==b.getY()) throw std::invalid_argument("odcinek nie może mieć dwóch takich samych punktów");
}
Punkt Odcinek::getA() const
{
    return this->a;
}
Punkt Odcinek::getB() const
{
    return this->b;
}
double Odcinek::getLength() const
{
    double d1=a.getX()-b.getX();
    double d2=a.getY()-b.getY();
    return sqrt(d1*d1+d2*d2);
}
bool rownolegle(const Odcinek&a, const Odcinek&b)
{
    const Punkt& a_start=a.getA();
    const Punkt& a_end=a.getB();
    const Punkt& b_start=b.getA();
    const Punkt& b_end=b.getB();
    double dxa = a_end.getX()-a_start.getX();
    double dxb = b_end.getX()-b_start.getX();
    double dya = a_end.getY()-a_start.getY();
    double dyb = b_end.getY()-b_start.getY();
    return dxa*dyb==dxb*dya;
}
bool prostopadle(const Odcinek&a, const Odcinek&b)
{
    const Punkt& a_start=a.getA();
    const Punkt& a_end=a.getB();
    const Punkt& b_start=b.getA();
    const Punkt& b_end=b.getB();
    double dxa = a_end.getX()-a_start.getX();
    double dxb = b_end.getX()-b_start.getX();
    double dya = a_end.getY()-a_start.getY();
    double dyb = b_end.getY()-b_start.getY();
    //(dya/dxa)*(dyb/dxb)=-1
    //dya/dxb==-dxa/dyb
    //dya*dyb=-dxa*dxb
    // std::cout<<dxa*dxb<<" "<<-dya*dyb;
    return dxa*dxb==-dya*dyb;
}

Trojkat::Trojkat(const Trojkat& o) : a(o.a), b(o.b), c(o.c) {}
Trojkat::Trojkat(const Punkt& a, const Punkt& b, const Punkt& c) : a(a), b(b), c(c) {
    if(a.getX()==b.getX() && a.getY()==b.getY()) throw std::invalid_argument("Trójkąt nie może mieć dwóch takich samych punktów");
    if(b.getX()==c.getX() && b.getY()==c.getY()) throw std::invalid_argument("Trójkąt nie może mieć dwóch takich samych punktów");
    if(a.getX()==c.getX() && a.getY()==c.getY()) throw std::invalid_argument("Trójkąt nie może mieć dwóch takich samych punktów");
}
Punkt Trojkat::getA() const
{
    return this->a;
}
Punkt Trojkat::getB() const
{
    return this->b;
}
Punkt Trojkat::getC() const
{
    return this->b;
}
double Trojkat::getObwod() const
{
    Odcinek ab=Odcinek(a, b);
    Odcinek bc=Odcinek(b, c);
    Odcinek ac=Odcinek(a, c);
    return ab.getLength()+bc.getLength()+ac.getLength();
}
double Trojkat::getArea() const
{
    Odcinek ab=Odcinek(a, b);
    Odcinek bc=Odcinek(b, c);
    Odcinek ac=Odcinek(a, c);
    double a=ab.getLength();
    double b=bc.getLength();
    double c=ac.getLength();
    double s=(a+b+c)/2;
    return sqrt(s*(s-a)*(s-b)*(s-c));
}
bool Trojkat::isPointInside(const Punkt& p) const
{
    if(p.getX()==a.getX() && p.getY()==a.getY()) return true;
    if(p.getX()==b.getX() && p.getY()==b.getY()) return true;
    if(p.getX()==c.getX() && p.getY()==c.getY()) return true;
    Trojkat t1=Trojkat(a, b, p);
    Trojkat t2=Trojkat(a, p, c);
    Trojkat t3=Trojkat(p, b, c);
    return t1.getArea()+t2.getArea()+t3.getArea()==this->getArea();
}

double Wektor::getX() const
{
    return this->X;
}
double Wektor::getY() const
{
    return this->Y;
}
Wektor::Wektor(double X, double Y)
{
    this->X=X;
    this->Y=Y;
}

double Prosta::getA() const
{
    return this->A;
}
double Prosta::getB() const
{
    return this->B;
}
double Prosta::getC() const
{
    return this->C;
}
Prosta::Prosta(const double A, const double B, const double C) {
    if(A==0 && B==0) throw std::invalid_argument("A i B nie mogą być jednocześnie równe 0");
    this->A=A;
    this->B=B;
    this->C=C;
}
Prosta::Prosta(const Prosta& p) {
    this->A=p.A;
    this->B=p.B;
    this->C=p.C;
}

void Punkt::translate(const Wektor& w)
{
    x+=w.getX();
    y+=w.getY();
}

void Punkt::rotate(const Punkt& p, const double deg)
{
    double s=sin(deg);
    double c=cos(deg);
    x-=p.getX();
    y-=p.getY();
    x=x*c-y*s+p.getX();
    y=x*s+y*c+p.getY();
}

void Punkt::sym_osiowa(const Prosta& p)
{
    double a = p.getA();
    double b = p.getB();
    double c = p.getC();

    double dist = (a * x + b * y + c) / sqrt(a * a + b * b);

    x = x - 2 * a * dist / (a * a + b * b);
    y = y - 2 * b * dist / (a * a + b * b);
}

void Punkt::sym_srodkowa(const Punkt& p)
{
    x = 2 * p.getX() - x;
    y = 2 * p.getY() - y;
}

void Odcinek::translate(const Wektor& w)
{
    a.translate(w);
    b.translate(w);
}

void Trojkat::translate(const Wektor& w)
{
    a.translate(w);
    b.translate(w);
    c.translate(w);
}

void Odcinek::rotate(const Punkt& p, const double deg)
{
    a.rotate(p,deg);
    b.rotate(p,deg);
}

void Trojkat::rotate(const Punkt& p, const double deg)
{
    a.rotate(p,deg);
    b.rotate(p,deg);
    c.rotate(p,deg);
}

void Odcinek::sym_osiowa(const Prosta& p)
{
    a.sym_osiowa(p);
    b.sym_osiowa(p);
}
void Trojkat::sym_osiowa(const Prosta& p)
{
    a.sym_osiowa(p);
    b.sym_osiowa(p);
    c.sym_osiowa(p);
}

void Odcinek::sym_srodkowa(const Punkt& p)
{
    a.sym_srodkowa(p);
    b.sym_srodkowa(p);
}

void Trojkat::sym_srodkowa(const Punkt& p)
{
    a.sym_srodkowa(p);
    b.sym_srodkowa(p);
    c.sym_srodkowa(p);
}

bool Trojkat::intersects(const Trojkat& t2) const
{
    return t2.isPointInside(a)||t2.isPointInside(b)||t2.isPointInside(c);
}