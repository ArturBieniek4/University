// Artur Bieniek
// 347165
// g++ z1.cpp -o /tmp/cppprog && /tmp/cppprog

#include <cassert>
#include <bits/stdc++.h>

using namespace std;

enum figtype_t
{
    unknown = 0,
    kwadrat = 1,
    prostokat = 2,
    kolo = 3,
};

struct Figura
{
    figtype_t figtype = unknown;
    float x = 0, y = 0;
    float size1 = 0, size2 = 0;
};

Figura* new_square(float x, float y, float size)
{
    Figura* f = new Figura;
    f->figtype=kwadrat;
    assert(size>0 && "Size of square must be positive");
    f->x = x;
    f->y = y;
    f->size1 = size;
    return f;
}

Figura* new_rect(float x, float y, float size1, float size2)
{
    Figura* f = new Figura;
    f->figtype=prostokat;
    assert(size1>0 && size2>0 && "Size of rectangle must be positive");
    f->x = x;
    f->y = y;
    f->size1 = size1;
    f->size2 = size2;
    return f;
}

Figura* new_circle(float x, float y, float r)
{
    Figura* f = new Figura;
    f->figtype=kolo;
    assert(r>0 && "Radius of circle must be positive");
    f->x = x;
    f->y = y;
    f->size1 = r;
    return f;
}

float pole(const Figura *f)
{
    switch (f->figtype)
    {
        case kwadrat:
            return (f->size1)*(f->size1);
        case prostokat:
            return (f->size1)*(f->size2);
        case kolo:
            return M_PI*(f->size1)*(f->size1);
        default:
            assert(false && "Unknown figure");
            return 0;
    }
}

void przesun(Figura *f, float x, float y)
{
    assert(f->figtype!=unknown && "Unknown figure");
    f->x+=x;
    f->y+=y;
}

void show(const Figura *f)
{
    string info="("+to_string(f->x)+", "+to_string(f->y)+") ";
    switch(f->figtype)
    {
        case kwadrat:
            info+="kwadrat, długość boku="+to_string(f->size1); break;
        case prostokat:
            info+="prostokąt, długości boków="+to_string(f->size1)+"x"+to_string(f->size2); break;
        case kolo:
            info+="koło, promień="+to_string(f->size1); break;
        default:
            assert(false && "Unknown figure"); break;
    }
    info+=", pole="+to_string(pole(f))+"\n";
    cout<<info;
}

float sumapol(Figura* f[], int size)
{
    assert(size>=0 && "Size of array cannot be negative");
    float suma=0;
    for(int i=0;i<size;i++)
    {
        suma+=pole(f[i]);
    }
    return suma;
}

int main()
{
    Figura * figury[3];
    figury[0]=new_square(1.0, 1.0, 3.0);
    figury[1]=new_rect(1.0, 1.0, 2.0, 4.0);
    figury[2]=new_circle(1.0, 1.0, 3.0);
    cout<<pole(figury[0])<<"\n";
    show(figury[0]);
    cout<<sumapol(figury, 3)<<"\n";
    przesun(figury[2], 10, -5);
    show(figury[2]);
    return 0;
}

// jak rozszerzymy o trapezy to trzeba zmienić structa, funkcję show i funkcję liczącą pole