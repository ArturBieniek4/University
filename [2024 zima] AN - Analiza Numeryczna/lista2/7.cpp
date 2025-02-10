#include <iostream>
#include <math.h>

using namespace std;

int main()
{
    cout<<"x^13="<<pow(0.001, 13)<<"\n";
    cout<<"x^13+4="<<pow(0.001, 13)+4<<"\n";
    cout<<"sqrt(x^13+4)="<<sqrt(pow(0.001, 13)+4)<<"\n";
    cout<<"sqrt(x^13+4)-2="<<sqrt(pow(0.001, 13)+4)-2<<"\n";
    cout<<"x^14="<<pow(0.001, 14)<<"\n";
    cout<<"(sqrt(x^13+4)-2)/x^14="<<(sqrt(pow(0.001, 13)+4)-2)/pow(0.001,14)<<"\n";
    cout<<"8096*((sqrt(x^13+4)-2)/x^14)="<<(sqrt(pow(0.001, 13)+4)-2)/pow(0.001,14)<<"\n";
    cout<<"8096/(2x+x*sqrt(x^13+4)="<<8096.0/(2*0.001+0.001*sqrt(pow(0.001,13)+4))<<"\n";
    return 0;
}