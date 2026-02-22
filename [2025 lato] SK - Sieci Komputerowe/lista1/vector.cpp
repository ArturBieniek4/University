#include <bits/stdc++.h>

using namespace std;

#define INF 10000
#define HOSTS 5
#define NETWORKS 6

int net_table[NETWORKS][HOSTS] = {
    {1, 1, INF, INF, INF},
    {INF, 1, INF, 1, INF},
    {INF, 1, 1, INF, INF},
    {INF, INF, INF, 1, 1},
    {INF, INF, 1, 1, INF},
    {INF, INF, INF, INF, INF}
};

bool changed=true;

bool run_stage() {
    bool changed=false;
    int new_table[NETWORKS][HOSTS];
    for(int net=0; net<NETWORKS; net++)
        for(int host=0; host<HOSTS; host++)
            new_table[net][host]=net_table[net][host];
    for(int host=0; host<HOSTS; host++)
    {
        for(int net=0; net<NETWORKS; net++)
        {
            if(net_table[net][host]==INF) continue;
            for(int neighbor = 0; neighbor<HOSTS; neighbor++) {
                if(neighbor==host) continue;
                if(net_table[net][neighbor]==INF) continue;
                for(int net2=0; net2<NETWORKS; net2++) {
                    if(net_table[net2][neighbor]==INF) continue;
                    if(net_table[net][host]+net_table[net][neighbor]+net_table[net2][neighbor]-1 < new_table[net2][host]) {
                        // cout<<"New route from "<<host<<" to "<<net<<" via "<<neighbor<<"\n";
                        new_table[net2][host] = net_table[net][host]+net_table[net][neighbor]+net_table[net2][neighbor]-1;
                        changed=true;   
                    }
                }
            }
        }
    }

    for(int net=0; net<NETWORKS; net++)
        for(int host=0; host<HOSTS; host++)
            net_table[net][host]=new_table[net][host];
    return changed;
}

int main() {
    while(run_stage());
    for (int net = 0; net < NETWORKS; net++) {
        cout << "Network " << net << ": ";
        for (int host = 0; host < HOSTS; host++) {
            if (net_table[net][host] == INF) cout << "INF\t";
            else cout << net_table[net][host] << "\t";
        }
        cout << endl;
    }
    cout<<endl;

    net_table[5][0]=1;
    net_table[5][4]=1;

    while(run_stage())
    {
        for (int net = 0; net < NETWORKS; net++) {
            cout << "Network " << net << ": ";
            for (int host = 0; host < HOSTS; host++) {
                if (net_table[net][host] == INF) cout << "INF\t";
                else cout << net_table[net][host] << "\t";
            }
            cout << endl;
        }
        cout<<endl;
    }
    return 0;
}