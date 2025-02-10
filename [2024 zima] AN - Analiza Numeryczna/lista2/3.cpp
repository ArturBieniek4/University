#include <iostream>
#include <math.h>

using namespace std;

int main()
{
    cout<<fixed;
    for(int s=-1; s<=1; s+=2)
        for(int c=-1; c<=1; c++)
        {
            // cout<<c<<" ";
            for(int e=0; e<2<<4; e++)
            {
                float wynik=0.5;
                for(int i=0;i<4;i++)
                {
                    int ei=(e&(1<<i))>>i;
                    wynik+=ei*pow(0.5, i+2);
                    // cout<<ei<<" ";
                }
                cout<<s*wynik*pow(2,c);
                cout<<"\n";
            }
        }
    return 0;
}