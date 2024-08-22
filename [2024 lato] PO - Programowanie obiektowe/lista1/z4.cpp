// Artur Bieniek
// 347165
// g++ z4.cpp -o /tmp/cppprog && /tmp/cppprog

#include <cassert>
#include <bits/stdc++.h>

using namespace std;

void tabliczka(float x1, float x2, float y1, float y2, float skok)
{
    cout<<"      ";
    for(float x=y1;x<y2;x+=skok)
    {
        cout<<fixed<<setprecision(2)<<x<<" ";
    }
    cout<<"\n";
    for(float y=x1;y<x2;y+=skok)
    {
        cout<<fixed<<setprecision(2)<<y<<": ";
        for(float x=y1;x<y2;x+=skok)
        {
            cout<<fixed<<setprecision(2)<<x*y<<" ";
        }
        cout<<"\n";
    }
}

int main()
{
    tabliczka(0.2, 1.3, 0.2, 3.14, 0.3);
    return 0;
}