// Artur Bieniek, 347165

#include <bits/stdc++.h>
#include <arpa/inet.h>
#include <poll.h>
#include <netinet/ip.h>

using namespace std;

struct route
{
    in_addr_t network;
    uint8_t netmask;
    uint32_t distance;
} __attribute__((packed));

enum link_state
{
    SEEN,
    UNSEEN,
    UNREACH
};

int sock_fd;

vector<pair<route, in_addr_t>> routing;
vector<pair<route, uint8_t>> direct;

const int round_len = 5000;

int round_timeleft=0;

in_addr_t ip_to_net(in_addr_t ip, uint32_t mask) {
    uint32_t netmask = (mask == 0) ? 0 : (0xFFFFFFFF << (32 - mask));
    return htonl(ntohl(ip) & netmask);
}

string ip_str(in_addr_t ip) {
    char sender_ip_str[20];
    inet_ntop(AF_INET, &(ip), sender_ip_str, sizeof(sender_ip_str));
    string ret = sender_ip_str;
    return ret;
}

void print_routing() {
    for(size_t i=0; i<routing.size(); i++) {
        route rt = routing[i].first;
        in_addr_t via = routing[i].second;
        if(rt.distance == UINT32_MAX && via!=0) continue;
        in_addr_t net_ip = ip_to_net(rt.network, rt.netmask);
        cout<<ip_str(net_ip)<<"/"<<(int)rt.netmask<<" ";
        if(rt.distance == UINT32_MAX) cout<<"unreachable";
        else cout<<"distance "<<ntohl(rt.distance);
        if(via!=0) cout<<" via "<<ip_str(via);
        else cout<<" connected directly";
        cout<<"\n";
    }
    cout<<"\n";
    assert(fflush(stdout) == 0);
}

void update_routing() {
    for(size_t i=0; i<direct.size(); i++) {
        uint8_t last_seen = direct[i].second;
        if(last_seen==SEEN) direct[i].second = UNSEEN;
        route dir = direct[i].first;
        for(size_t j=0; j<routing.size(); j++) {
            route rt = routing[j].first;
            in_addr_t via = routing[j].second;
            if(via==0) via = rt.network;
            via = ip_to_net(via, dir.netmask);
            if(ip_to_net(dir.network, dir.netmask) == ip_to_net(rt.network, rt.netmask)
            && dir.netmask == rt.netmask
            && ntohl(dir.distance) < ntohl(rt.distance))
            {
                if(last_seen!=UNREACH) {
                    routing[j].first = dir;
		    routing[j].second = 0;
		}
                else if(routing[i].first.distance==ntohl(UINT32_MAX))
                    routing[j].second = 0;
            }
            else if(via!=ip_to_net(rt.network, dir.netmask)
            && via == ip_to_net(dir.network, dir.netmask)
            && last_seen!=SEEN)
                routing[j].first.distance = htonl(UINT32_MAX);
        }
    }
}

void broadcast_routing() {
    for(size_t i=0; i<direct.size(); i++) {
        route net = direct[i].first;

        uint32_t netmask = (net.netmask == 0) ? 0 : (0xFFFFFFFF << (32 - net.netmask));
        in_addr_t broadcast = htonl(ntohl(net.network) | (~netmask));

        struct sockaddr_in addr;
        memset((void*)&addr, 0, sizeof(addr));
        addr.sin_family = AF_INET;
        addr.sin_addr.s_addr = broadcast;
        addr.sin_port = htons(54321);
        for(size_t j=0; j<routing.size(); j++)
        {
            route rt = routing[j].first;
            if(ip_to_net(routing[j].second, net.netmask) == ip_to_net(net.network, net.netmask))
                continue; // Nie wysyłamy trasy tam skąd przyszła bo zrobią się cykle
            if((sendto(sock_fd, (char*)&rt, sizeof(rt), 0, (const sockaddr*)&(addr), sizeof(addr))<0))
            {
                direct[i].second=UNREACH;
                for(size_t k=0; k<routing.size(); k++) {
                    if(routing[k].second!=0) continue;
                    route rt2 = routing[k].first;
                    if(ip_to_net(rt2.network, rt2.netmask) == ip_to_net(net.network, net.netmask))
                    {
                        routing[k].first.distance=UINT32_MAX;
                    }
                }
                break; // Nie ma sensu wysyłać reszty do sieci która nie działa
            }
            else if(direct[i].second==UNREACH) {
                direct[i].second = UNSEEN;
            }
        }
    }
}

int main() {
    int n_interf;
    cin>>n_interf;
    for(int i=0; i<n_interf; i++) {
        string ip, kw;
        uint32_t dist;
        cin>>ip>>kw>>dist;

        assert(kw=="distance");
        size_t delim_pos = ip.find('/');
        assert(delim_pos != string::npos && "Wrong network address\n");
        string ip_only = ip.substr(0, delim_pos);
        const char* ip_str = ip_only.c_str();
        string netmask_str = ip.substr(delim_pos+1, ip.size()-delim_pos-1);

        in_addr_t net_ip;
        if(inet_pton(AF_INET, ip_str, &net_ip)<0) {
            perror("inet_pton");
            exit(-1);
        }
        uint8_t net_mask = stoi(netmask_str);
        route rt = {net_ip, net_mask, htonl(dist)};
        routing.push_back(make_pair(rt, 0));
        direct.push_back(make_pair(rt, UNSEEN));
    }
    sock_fd = socket(AF_INET, SOCK_DGRAM, 0);
    if(sock_fd < 0) {
        perror("Socket error");
        exit(1);
    }

    int yes = 1;
    if (setsockopt(sock_fd, SOL_SOCKET, SO_BROADCAST, (char*)&yes, sizeof(yes)) < 0) {
        perror("Setsockopt error");
        exit(1);
    }

    struct sockaddr_in server_address;
    memset(&server_address, 0, sizeof(server_address));
    server_address.sin_family = AF_INET;
    server_address.sin_port = htons(54321);
    server_address.sin_addr.s_addr = htonl(INADDR_ANY);

    if (bind(sock_fd, (struct sockaddr*)&server_address, sizeof(server_address)) < 0)
        perror("Bind error");
    struct pollfd ps;
    ps.fd = sock_fd;
    ps.events = POLLIN;
    ps.revents = 0;
    while(true)
    {
        auto now = chrono::system_clock::now();
        int ready = poll(&ps, 1, round_timeleft);
        int elapsed = chrono::duration_cast<chrono::milliseconds>(chrono::system_clock::now()-now).count();
        round_timeleft -=elapsed;
        if(round_timeleft<=0) {
            round_timeleft = round_len;
            update_routing();
            broadcast_routing();
            print_routing();
        }
        if(ready>0) {
            struct sockaddr_in sender;
            socklen_t sender_len = sizeof(sender);
            uint8_t buffer[sizeof(route)];
            ssize_t datagram_len = recvfrom(sock_fd, buffer, sizeof(route), 0, (struct sockaddr*)&sender, &sender_len);
            if(datagram_len<0) {
                perror("recvfrom error");
                continue;
            }
            assert(datagram_len==sizeof(route));
            
            bool from_self=false;
            for(size_t i=0; i<direct.size(); i++) {
                if(direct[i].first.network == sender.sin_addr.s_addr) {
                    from_self=true;
                    break;
                }
            }

            if(from_self) continue;

            route new_rt = *(route *)&buffer;
            size_t sender_net_id=SIZE_MAX;
            size_t matching_net_id=SIZE_MAX;
            bool force_infinity = false;
            for(size_t i=0; i<direct.size(); i++) {
                route rt = direct[i].first;
                if(ip_to_net(sender.sin_addr.s_addr, rt.netmask) == ip_to_net(rt.network, rt.netmask)) {
                    direct[i].second=SEEN;
                    sender_net_id = i;
                }
            }
            for(size_t i=0; i<routing.size(); i++) {
                route rt = routing[i].first;
                in_addr_t via = routing[i].second;
                if(ip_to_net(rt.network, rt.netmask) == ip_to_net(new_rt.network, new_rt.netmask)
                && via == sender.sin_addr.s_addr
                && ntohl(new_rt.distance)==UINT32_MAX) {
                    force_infinity=true;
                }
                if(ip_to_net(rt.network, rt.netmask) == ip_to_net(new_rt.network, new_rt.netmask) && rt.netmask == new_rt.netmask)
                {
                    matching_net_id = i;
                }
            }
            assert(sender_net_id!=SIZE_MAX);
            size_t sender_net_dist = ntohl(direct[sender_net_id].first.distance);
            if(matching_net_id!=SIZE_MAX) {
                size_t matching_net_dist = ntohl(routing[matching_net_id].first.distance);
                size_t new_rt_dist = ntohl(new_rt.distance)+sender_net_dist;
                if(ntohl(new_rt.distance)!=UINT32_MAX && sender_net_dist!=UINT32_MAX && new_rt_dist<matching_net_dist) {
                    new_rt.distance = htonl(new_rt_dist);
                    routing[matching_net_id] = make_pair(new_rt, sender.sin_addr.s_addr);
                }
                else if(force_infinity) {
                    routing[matching_net_id] = make_pair(new_rt, sender.sin_addr.s_addr);
                }
            }
            else if(ntohl(new_rt.distance)!=UINT32_MAX && sender_net_dist!=UINT32_MAX){
                new_rt.distance = htonl(ntohl(new_rt.distance)+sender_net_dist);
                routing.push_back(make_pair(new_rt, sender.sin_addr.s_addr));
            }
        }
    }

    return 0;
}
