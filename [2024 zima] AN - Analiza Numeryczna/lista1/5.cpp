#include <iostream>
#include <math.h>
#include <iomanip>

using namespace std;

#define PRECISION float

void normal(int n)
{
    PRECISION val=log(2025.0/2024.0);
    PRECISION i=0;
    cout<<"("<<i<<")="<<val<<"\n";
    while(i<n)
    {
        i++;
        val=1/i-2024*val;
        cout<<"("<<i<<")="<<val<<"\n";
    }
}


void even(int n)
{
    PRECISION val=log(2025.0/2024.0);
    PRECISION i=0;
    cout<<"("<<i<<")="<<val<<"\n";
    while(i<n)
    {
        val=1/(i+2)-2024*(1/(i+1)-2024*val);
        i+=2;
        cout<<"("<<i<<")="<<val<<"\n";
    }
}

void odd(int n)
{
    PRECISION val=log(2025.0/2024.0);
    PRECISION i=1;
    val=1/i-2024*val;
    cout<<"("<<i<<")="<<val<<"\n";
    while(i<n)
    {
        val=1/(i+2)-2024*(1/(i+1)-2024*val);
        i+=2;
        cout<<"("<<i<<")="<<val<<"\n";
    }
}

int main()
{
    cout<<setprecision(20)<<fixed;
    normal(20);
    odd(20);
    even(20);
    return 0;
}