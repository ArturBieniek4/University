#include "10_bst.hpp"
#include "10_bst.cpp"
#include <bits/stdc++.h>
using namespace std;

int main()
{
    bst<int, por<int>> t1 = bst<int, por<int>>();
    t1.insert(7);
    t1.insert(2);
    t1.insert(9);
    t1.insert(5);
    cout<<t1.find(3)<<"\n";
    t1.remove(9);
    cout<<t1.find(9)<<"\n";
    cout<<t1<<"\n";
    bst<int, por<int>> t2 = bst<int, por<int>>(initializer_list<int> {1,3,2,4});
    cout<<t2<<"\n";
    string op="";
    bst<int, por<int>> t3 = bst<int, por<int>>();
    while(op!="exit")
    {
        cin>>op;
        if(op=="insert")
        {
            int val;
            cin>>val;
            t3.insert(val);
            cout<<t3<<"\n";
        }
        if(op=="remove")
        {
            int val;
            cin>>val;
            t3.remove(val);
            cout<<t3<<"\n";
        }
        if(op=="find")
        {
            int val;
            cin>>val;
            cout<<t3.find(val)<<"\n";
        }
        if(op=="print")
        {
            cout<<t3<<"\n";
        }
    }
    return 0;
}