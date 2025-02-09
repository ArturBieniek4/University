#include "4_liczba.hpp"
#include <bits/stdc++.h>

Liczba::Liczba(double val)
{
    stack=new double[MAX_HISTORY];
    stack[0]=val;
    top=0;
    maxtop=0;
}

Liczba::Liczba() : Liczba(0) {}

Liczba::~Liczba()
{
    delete[] stack;
}

Liczba::Liczba(const Liczba& l)
{
    stack=new double[MAX_HISTORY];
    stack[0]=l.stack[l.top];
    top=0;
    maxtop=0;
}

Liczba::Liczba(Liczba&& l)
{
    stack=l.stack;
    top=l.top;
    maxtop=l.maxtop;
    l.stack=nullptr;
}

double Liczba::getValue()
{
    return stack[top];
}

void Liczba::nextValue(double val)
{
    top++;
    if(top==MAX_HISTORY) top=0;
    stack[top]=val;
    if(top>maxtop) maxtop=top;
}

void Liczba::prevValue()
{
    if(top==0)
    {
        if(maxtop==0)
        {
            throw std::out_of_range("Nie ma poprzedniej wartości!\n");
        }
        top=maxtop;
    }
    else
    {
        top--;
    }
}

const Liczba &Liczba::operator=(const Liczba& l)
{
    this->~Liczba();
    stack=new double[MAX_HISTORY];
    stack[0]=l.stack[l.top];
    top=0;
    maxtop=0;
    return *this;
}

const Liczba &Liczba::operator=(Liczba&& l)
{
    stack=l.stack;
    top=l.top;
    maxtop=l.maxtop;
    l.stack=nullptr;
    return *this;
}