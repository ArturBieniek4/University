#include <bits/stdc++.h>

using namespace std;

int sol[8];
bool zmienna[2];

bool check()
{
    return (zmienna[sol[6]]||zmienna[sol[7]]) ? (zmienna[sol[0]] ? zmienna[sol[2]] : zmienna[sol[1]]) : (zmienna[sol[3]] ? zmienna[sol[5]] : zmienna[sol[4]]);
}

bool check_formula()
{
    return zmienna[1]&&!zmienna[2] || zmienna[0]&&zmienna[2] || !zmienna[1]&&zmienna[2];
}

bool check2(int depth)
{
    if(depth==3)
    {
        return check()==check_formula();
    }
    else
    {
        zmienna[depth]=0;
        bool r1=check2(depth+1);
        zmienna[depth]=1;
        return r1&&check2(depth+1);
    }
    //y!z+xz+!yz
}

void solve(int depth)
{
    if(depth==7)
    {
        if(check2(0))
        {
            cout<<sol[0]<<" "<<sol[1]<<" "<<sol[2]<<" "<<sol[3]<<" "<<sol[4]<<" "<<sol[5]<<" "<<sol[6]<<" "<<sol[7]<<"\n";
        }
    }
    else
    {
        sol[depth]=0;
        solve(depth+1);
        sol[depth]=1;
        solve(depth+1);
        sol[depth]=2;
        solve(depth+1);
    }
}

int main()
{
    solve(0);
    return 0;
}