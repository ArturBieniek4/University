#include "7_piksele.hpp"
#include <bits/stdc++.h>
using namespace std;

int main()
{
    Kolor k1(200,0,100);
    cout<<k1<<"\n";
    k1.rozjasnij(20);
    cout<<k1<<"\n";
    k1.rozjasnij(1000);
    cout<<k1<<"\n";
    k1.przyciemnij(90);
    cout<<k1<<"\n";
    Kolor k2;
    k2.setG(255);
    cout<<k2<<"\n";
    cout<<Kolor::merge(k2, k1)<<"\n";
    Kolortransparentny k3(50, 100, 200, 70);
    cout<<k3<<"\n";
    Kolornazwany k4(134,13,51, "nazwajakas");
    cout<<k4<<"\n";
    k4.setName("innanazwa");
    cout<<k4<<"\n";
    Kolortn k5(156,12,190,80,"tn");
    cout<<k5.getR()<<" "<<k5.getG()<<" "<<k5.getB()<<"\n";
    cout<<k5<<"\n";
    Piksel p1(100,200);
    cout<<p1<<"\n";
    Pikselkolorowy p2(500, 600, k5);
    cout<<p2<<"\n";
    cout<<p2.distFromLeft()<<" "<<p2.distFromRight()<<" "<<p2.distFromUp()<<" "<<p2.distFromDown()<<"\n";
    cout<<Piksel::dist(p1,p2)<<"\n";
    p2.move(1000,1);
    cout<<p2<<"\n";
    return 0;
}