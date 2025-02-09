#include<bits/stdc++.h>
#include "3_geo.hpp"

using namespace std;

int main()
{
    Punkt p(0,0);
    cout<<p.getX()<<" "<<p.getY()<<"\n";
    Punkt p2(5,0);
    Punkt p3(0,5);
    Odcinek o = Odcinek(p,p2);
    cout<<o.getLength()<<"\n";
    Odcinek o2 = Odcinek(p,p2);
    Odcinek o3 = Odcinek(p,p3);
    cout<<rownolegle(o, o2)<<"\n";
    cout<<rownolegle(o, o3)<<"\n";
    cout<<prostopadle(o, o3)<<"\n";
    Trojkat t=Trojkat(p,p2,p3);
    cout<<t.getObwod()<<"\n";
    cout<<t.getArea()<<"\n";
    cout<<t.isPointInside(p)<<"\n";
    cout<<t.isPointInside(p2)<<"\n";
    cout<<t.isPointInside(p3)<<"\n";
    cout<<t.isPointInside(Punkt(-1, -1))<<"\n";
    Wektor w=Wektor(1,1);
    return 0;
}