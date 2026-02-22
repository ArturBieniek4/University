// Artur Bieniek, 347165

#include <arpa/inet.h>
#include <poll.h>
#include <netinet/ip.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/time.h>
#include <fcntl.h>
#include <sys/stat.h>

int sock_fd;
FILE * outfile;
char* server_ip_str;
char* filename;
int server_port;
int destlen;
in_addr_t server_ip;
int data_written=0;
struct timeval programStart;

#define MAX_WAIT 500
#define REQ_QUEUE_LEN 1000
#define MAX_DATA_LEN 1000

enum reqState {
    EMPTY,
    REQUESTED,
    FINISHED
};

struct requestedPacket {
    int requestedOn;
    enum reqState state;
    char data[MAX_DATA_LEN];
};

struct requestedPacket reqdata[REQ_QUEUE_LEN];

int getMilis() {
    struct timeval now;
    gettimeofday(&now, NULL);
    return ((int)(now.tv_sec) - (int)(programStart.tv_sec)) * 1000 + (int)(now.tv_usec - programStart.tv_usec)/1000;
}

void request_data(int start) {
    int len = destlen-data_written;
    if(len>MAX_DATA_LEN) len=MAX_DATA_LEN;
    struct sockaddr_in server_address;
    memset(&server_address, 0, sizeof(server_address));
    server_address.sin_family = AF_INET;
    server_address.sin_port = htons(server_port);
    server_address.sin_addr.s_addr = server_ip;
    char message[64];
    sprintf(message, "GET %d %d\n", start, len);
    if(sendto(sock_fd, message, strlen(message), 0, (struct sockaddr*)&server_address, sizeof(server_address))<0) {
        perror("sendto");
        exit(-1);
    }
}

void processRequests() {
    for(int i=0; i<REQ_QUEUE_LEN; i++) {
        struct requestedPacket reqpacket = reqdata[i];
        if(reqpacket.state==FINISHED) {
            int data_len = destlen-data_written;
            if(data_len>1000) data_len=1000;
            for(ssize_t i=0; i<data_len; i++) {
                fputc(reqpacket.data[i], outfile);
            }
            fflush(outfile);
            data_written+=data_len;
            printf("%.3f%% done\n", 100*(float)data_written/(float)destlen);
            fflush(stdout);
        }
        else if(i>0){
            for(int j=0; j<REQ_QUEUE_LEN-i; j++) {
                reqdata[j]=reqdata[i+j];
                reqdata[i+j].state = EMPTY;
            };
            break;
        }
        else break;
    }
    for(int i=0; i<REQ_QUEUE_LEN; i++) {
        int start = data_written+i*1000;
        struct requestedPacket reqpacket = reqdata[i];
        if(start>=destlen) break;
        if(reqpacket.state==EMPTY || (reqpacket.state==REQUESTED && getMilis()-reqpacket.requestedOn>MAX_WAIT)) {
            reqpacket.state=REQUESTED;
            request_data(start);
            reqpacket.requestedOn=getMilis();
        }
        reqdata[i]=reqpacket;
        
    }
}

int main(int argc, char** argv) {
    gettimeofday(&programStart, NULL);
    if(argc!=5) {
        fprintf(stderr, "Usage: transport server_ip port filename length\n");
        exit(-1);
    }
    server_ip_str = argv[1];
    server_port = atoi(argv[2]);
    filename = argv[3];
    destlen = atol(argv[4]);
    if(inet_pton(AF_INET, server_ip_str, &server_ip)<0) {
        perror("inet_pton");
        exit(-1);
    }
    sock_fd = socket(AF_INET, SOCK_DGRAM, 0);
    if(sock_fd < 0) {
        perror("Socket error");
        exit(1);
    }
    outfile = fopen(filename, "wb");
    processRequests();
    struct pollfd ps;
    ps.fd = sock_fd;
    ps.events = POLLIN;
    ps.revents = 0;
    while(1)
    {
        int ready = poll(&ps, 1, MAX_WAIT);
        if(ready>0) {
            struct sockaddr_in sender;
            socklen_t sender_len = sizeof(sender);
            char buffer[IP_MAXPACKET];
            ssize_t datagram_len = recvfrom(sock_fd, buffer, IP_MAXPACKET, 0, (struct sockaddr*)&sender, &sender_len);
            if(datagram_len<0) {
                perror("recvfrom error");
                continue;
            }
            char sender_ip_str[20];
            inet_ntop(AF_INET, &(sender.sin_addr), sender_ip_str, sizeof(sender_ip_str));
            if(datagram_len<9) continue;
            if(sender.sin_addr.s_addr!=server_ip || sender.sin_port!=htons(server_port)) continue;
            char * data;
            data = strtok(buffer, " ");
            if(strcmp(data, "DATA")!=0) continue;
            data = strtok(NULL, " ");
            int data_start = atol(data);
            data = strtok(NULL, "\n");
            int data_len = atol(data);
            if(data_written>data_start) continue;
            int window_pos = (data_start - data_written)/1000;
            for(ssize_t i=datagram_len-data_len; i<datagram_len; i++) {
                reqdata[window_pos].data[i-datagram_len+data_len]=buffer[i];
            }
            reqdata[window_pos].state=FINISHED;
        }
        processRequests();
        if(data_written==destlen) {
            break;
        }
    }
    fclose(outfile);
    return 0;
}
