#include <bits/stdc++.h>
#include <arpa/inet.h>
#include <netinet/ip.h>
#include <netinet/ip_icmp.h>
#include <poll.h>

using namespace std;

u_int16_t compute_icmp_checksum(const void *buff, int length)
{
    const u_int16_t* ptr = (const u_int16_t*)buff;
    u_int32_t sum = 0;
    assert (length % 2 == 0);
    for (; length > 0; length -= 2)
        sum += *ptr++;
    sum = (sum >> 16U) + (sum & 0xffffU);
    return (u_int16_t)(~(sum + (sum >> 16U)));
}

int main(int argc, char ** argv) {
	if(argc!=2) {
		cout<<"Usage: ./traceroute ip_address\n";
		return 1;
	}

	int sock;

	if((sock = socket(AF_INET, SOCK_RAW, IPPROTO_ICMP))<0) {
		perror("Failed to create a socket");
		return 1;
	}

	struct sockaddr_in addr;
	memset(&addr, 0, sizeof(addr));
	addr.sin_family=AF_INET;
	if(inet_pton(AF_INET, argv[1], &addr.sin_addr.s_addr)<=0)
	{
		cerr<<"Invalid IP address!\n";
		return 1;
	}

	for(int ttl=1; ttl<=30; ttl++)
	{
		struct icmphdr packet;
		memset(&packet, 0, sizeof(packet));
		packet.type=ICMP_ECHO;
		packet.un.echo.id=htons(getpid());
		packet.un.echo.sequence=ttl;
		packet.checksum=compute_icmp_checksum(&packet, sizeof(packet));
		
		if(setsockopt(sock, IPPROTO_IP, IP_TTL, (char *) &ttl, sizeof(ttl))) {
			perror("Failed to set TTL");
			return 1;
		}

		for(int i=0; i<3; i++)
		{
			if((sendto(sock, &packet, sizeof(packet), 0, (const sockaddr*)&addr, sizeof(addr))<0))
			{
				perror("Sendto error");
				return 1;
			}
		}
		
		auto now = chrono::system_clock::now();
		int sum_ms=0;
		int num_ans=0;
		set<string> ips;
		while(num_ans<3)
		{
			int time_left = 1000-chrono::duration_cast<chrono::milliseconds>(chrono::system_clock::now()-now).count();
			if(time_left<=0) break;
			struct pollfd fds[1];
			fds[0].fd = sock;
			fds[0].events = POLLIN;
			int ret = poll(fds, 1, time_left);

			if(ret>0 && fds[0].revents&POLLIN) {
				struct sockaddr_in sender;
				socklen_t sender_len = sizeof(sender);
				u_int8_t buffer[IP_MAXPACKET];
				ssize_t packet_len = recvfrom(sock, buffer, IP_MAXPACKET, 0, (struct sockaddr*)&sender, &sender_len);
				if (packet_len < 0) {
					perror("recvfrom");
					return 1;
				}
				
				char sender_ip_str[20];
				inet_ntop(AF_INET, &(sender.sin_addr), sender_ip_str, sizeof(sender_ip_str));
				struct ip* ip_header = (struct ip*) buffer;
				size_t ip_header_len = ip_header->ip_hl * 4;
				struct icmphdr* reply = (struct icmphdr*)(buffer + ip_header_len);
				if(reply->type == ICMP_TIME_EXCEEDED) {
					struct ip* original_ip = (struct ip*)(buffer + ip_header_len + sizeof(struct icmphdr));
					size_t original_ip_len = original_ip->ip_hl * 4;
					reply = (struct icmphdr*)(buffer+ip_header_len+sizeof(struct icmphdr) + original_ip_len);
				}
				if(reply->un.echo.id!=htons(getpid())) continue;
				if(reply->un.echo.sequence!=ttl) continue;
				num_ans++;
				sum_ms += chrono::duration_cast<chrono::milliseconds>(chrono::system_clock::now()-now).count();
				ips.insert(sender_ip_str);
			}
		}
		
		for(auto it=ips.begin(); it!=ips.end(); it++)
		{
			cout<<*it<<" ";
		}
		if(num_ans==0) cout<<'*';
		else if(num_ans==3) cout<<sum_ms/3<<"ms";
		else cout<<"???";
		cout<<"\n";
		if(ips.size()==1 && ips.contains(argv[1])) break;
	}

	if(close(sock)<0) {
		perror("Failed to close socket");
		return 1;
	}
	return 0;
}
