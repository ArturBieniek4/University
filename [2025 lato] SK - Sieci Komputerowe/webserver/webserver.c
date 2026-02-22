// Artur Bieniek, 347165

#include <arpa/inet.h>
#include <fcntl.h>
#include <netinet/ip.h>
#include <poll.h>
#include <signal.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/stat.h>
#include <sys/time.h>
#include <unistd.h>

int sock_fd;
int server_port;
char *root_dir;

char* get_content_type(char* path)
{
	const char* dot = strrchr(path, '.');
	if(!dot || path==dot) return "application/octet-stream";
	const char* ext = dot+1;
	if(strcmp(ext, "txt")==0) return "text/plain; charset=utf-8";
	else if(strcmp(ext, "html")==0) return "text/html; charset=utf-8";
	else if(strcmp(ext, "css")==0) return "text/css; charset=utf-8";
	else if(strcmp(ext, "jpg")==0) return "image/jpeg";
	else if(strcmp(ext, "jpeg")==0) return "image/jpeg";
	else if(strcmp(ext, "png")==0) return "image/png";
	else if(strcmp(ext, "pdf")==0) return "application/pdf";
	else return "application/octet-stream";
}

void handle_connection() {
	int connected_sock_fd = accept(sock_fd, NULL, NULL);
	if (connected_sock_fd < 0) {
		perror("Accept error");
		exit(1);
	}

	struct timeval timeout = { .tv_sec = 1, .tv_usec = 0 };
    setsockopt(connected_sock_fd, SOL_SOCKET, SO_RCVTIMEO, &timeout, sizeof(timeout));

	enum { BUFFER_SIZE = 10000 };
	int keepalive = 1;
	while(keepalive) {
		char recv_buffer[BUFFER_SIZE + 1];
		char filebuf[1000];
		ssize_t bytes_read = recv(connected_sock_fd, recv_buffer, BUFFER_SIZE, 0);
		if (bytes_read <= 0) break;
		keepalive=(bytes_read>0)?1:0;
		recv_buffer[bytes_read] = '\0';
		char *line = strtok(recv_buffer, "\r\n");
		char method[7];
		char path[1024];
		char httpver[10];
		if(line==NULL || sscanf(line, "%6s %1023s %9s", method, path, httpver)<3) {
			strcpy(filebuf, "HTTP/1.1 501\r\n\r\n");
			send(connected_sock_fd, filebuf, strlen(filebuf), 0);
			continue;
		}
		printf("%s %s %s\n", method, path, httpver);
		char *host_str = NULL;
		while ((line = strtok(NULL, "\r\n"))) {
			if (strlen(line) == 0)
				break;
			char *col = strchr(line, ':');
			if (!col)
				continue;
			*col = '\0';
			char *v = col + 1;
			if ((*v) == ' ')
				v++;
			if (strcmp(line, "Host") == 0) {
				host_str = malloc(sizeof(char) * (strlen(v) + strlen(root_dir) + 3));
				strcpy(host_str, root_dir);
				strcat(host_str, "/");
				strcat(host_str, v);
				char *col2 = strchr(host_str, ':');
				if (!col2)
					continue;
				*col2 = '\0';
			}
			if (strcmp(line, "Connection") == 0 && strcmp(v, "close") == 0) {
				keepalive=0;
			}
		}
		char *host_path = realpath(host_str, NULL);
		free(host_str);
		if(host_path!=NULL && strncmp(root_dir, host_path, strlen(root_dir))!=0)
			host_path = NULL;
		if(host_path!=NULL) {
			char * content_path = malloc(sizeof(char) * (strlen(host_path) + strlen(path) + 3));
			strcpy(content_path, host_path);
			strcat(content_path, "/");
			strcat(content_path, path);
			content_path = realpath(content_path, NULL);
			if(content_path!=NULL && strncmp(host_path, content_path, strlen(host_path)))
				content_path=NULL;
			if (content_path == NULL) {
				strcpy(filebuf, "HTTP/1.1 404\r\n");
				send(connected_sock_fd, filebuf, strlen(filebuf), 0);
			}
			else {
				struct stat path_stat;
				stat(content_path, &path_stat);
				if(!(S_ISREG(path_stat.st_mode))) {
					if(path[strlen(path)-1]=='/') path[strlen(path)-1]='\0';
					send(connected_sock_fd, filebuf, snprintf(filebuf, sizeof(filebuf), "HTTP/1.1 301\r\nLocation: %s/index.html\r\n\r\n", path), 0);
				}
				else {
					FILE *fptr = fopen(content_path, "r");
					fseek(fptr, 0, SEEK_END);
					size_t filesz = ftell(fptr);
					fseek(fptr, 0, SEEK_SET);
					snprintf(filebuf, sizeof(filebuf), "HTTP/1.1 200\r\nContent-Length: %ld\r\nContent-Type: %s\r\n\r\n", filesz, get_content_type(path));
					send(connected_sock_fd, filebuf, strlen(filebuf), 0);
					size_t nread;
					while((nread = fread(filebuf, 1, sizeof(filebuf), fptr))>0) {
						send(connected_sock_fd, filebuf, nread, 0);
					}
					fclose(fptr);
				}
			}
			free(content_path);
		}
		else {
			strcpy(filebuf, "HTTP/1.1 501\r\n\r\n");
			send(connected_sock_fd, filebuf, strlen(filebuf), 0);
		}
	}
	if (close(connected_sock_fd) < 0) {
		perror("Close error");
		exit(1);
	}
	printf("Connection closed!\n");
}

int main(int argc, char **argv) {
	if (argc != 3) {
		fprintf(stderr, "Usage: webserver port root_dir\n");
		exit(-1);
	}
	server_port = atoi(argv[1]);
	if(server_port==0) {
		fprintf(stderr, "Server port incorrect!\n");
		exit(1);
	}
	root_dir = realpath(argv[2], NULL);
	if (root_dir == NULL) {
		fprintf(stderr, "Root directory incorrect!\n");
		exit(1);
	}
	sock_fd = socket(AF_INET, SOCK_STREAM, 0);
	if (sock_fd < 0) {
		perror("Socket error");
		exit(1);
	}
	const int en = 1;
	if (setsockopt(sock_fd, SOL_SOCKET, SO_REUSEADDR, &en, sizeof(en)) < 0) {
		perror("Setsockopt error");
		exit(1);
	}
	struct sockaddr_in server_addr = {0};
	server_addr.sin_family = AF_INET;
	server_addr.sin_port = htons(server_port);
	server_addr.sin_addr.s_addr = htonl(INADDR_ANY);
	if (bind(sock_fd, (struct sockaddr *)&server_addr, sizeof(server_addr)) <
		0) {
		perror("Bind error");
		exit(1);
	}
	if (listen(sock_fd, 64) < 0) {
		perror("Listen error");
		exit(1);
	}

	while (1) {
		handle_connection();
	}
	if (close(sock_fd) < 0) {
		perror("Close error");
		exit(1);
	}
	return 0;
}
