#include <bits/stdc++.h>

using namespace std;

struct A {
int8_t a; // 1 bajt ale + padding więc 8 bajtów
void *b; // 8 bajtów
int8_t c; // 1 bajt ale padding więc 2 bajty
int16_t d; // 2 bajty ale nie da się zająć mniej pamięci więc de facto 6 bajtów
};//razem 24

struct B {
uint16_t a; // 2 bajty ale padding więc 8 bajtów
double b; // 8 bajtów
void *c; // 8 bajtów
};//razem 24

struct C{
    char c1[2];
    short s;
    char c2;
};

int main()
{
    A *a = new A;
    cout<<sizeof(struct A)<<"\n";
    cout<<sizeof(a->a)<<"\n";
    cout<<sizeof(a->b)<<"\n";
    cout<<sizeof(a->c)<<"\n";
    cout<<sizeof(a->d)<<"\n";
    cout<<(void *)&a->a<<"\n";
    cout<<(void *)&a->b<<"\n";
    cout<<(void *)&a->c<<"\n";
    cout<<(void *)&a->d<<"\n";

    cout<<"\n";

    B *b = new B;
    cout<<sizeof(struct B)<<"\n";
    cout<<sizeof(b->a)<<"\n";
    cout<<sizeof(b->b)<<"\n";
    cout<<sizeof(b->c)<<"\n";
    cout<<(void *)&b->a<<"\n";
    cout<<(void *)&b->b<<"\n";
    cout<<(void *)&b->c<<"\n";

    cout<<sizeof(struct C)<<"\n";

    return 0;
}