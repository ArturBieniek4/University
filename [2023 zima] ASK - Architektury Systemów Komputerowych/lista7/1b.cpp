#include <bits/stdc++.h>

using namespace std;

struct node {
    union {
        struct {
            int n_data[2];
            short n_key;
            unsigned char n_type;
        } s;
        unsigned l_value[2];
    } u;
    int (*hashfn)(char *);
    short flags;
    char id[2];
};

int main()
{
    node n;
    cout<<"field\t\t\t\talignof\t\toffsetof\tsizeof\n";
    cout<<"char id[2]\t\t\t"<<alignof(n.id)<<"\t\t"<<offsetof(node, id)<<"\t\t"<<sizeof(n.id)<<"\n";
    cout<<"int (*hashfn)(char *)\t\t"<<alignof(n.hashfn)<<"\t\t"<<offsetof(node, hashfn)<<"\t\t"<<sizeof(n.hashfn)<<"\n";
    cout<<"short flags\t\t\t"<<alignof(n.flags)<<"\t\t"<<offsetof(node, flags)<<"\t\t"<<sizeof(n.flags)<<"\n";
    cout<<"union u\t\t\t\t"<<alignof(n.u)<<"\t\t"<<offsetof(node, u)<<"\t\t"<<sizeof(n.u)<<"\n";
    cout<<"sizeof(node)="<<sizeof(node)<<"\n";
    return 0;
}