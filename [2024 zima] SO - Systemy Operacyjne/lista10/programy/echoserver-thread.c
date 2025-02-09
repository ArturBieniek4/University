#include "csapp.h"
#include "rio.h"

#define LISTENQ 10

typedef struct client {
  int connfd;
} client_t;

static void echo(int connfd) {
  size_t n;
  char buf[MAXLINE];
  rio_t rio;

  rio_readinitb(&rio, connfd);
  while ((n = Rio_readlineb(&rio, buf, MAXLINE)))
    Rio_writen(connfd, buf, n);
}

static void *thread(void *vargp) {
  int connfd = ((client_t *)vargp)->connfd;
  free(vargp);

  Pthread_detach(pthread_self());
  echo(connfd);
  Close(connfd);
  return NULL;
}

int main(int argc, char **argv) {
  if (argc != 2)
    app_error("usage: %s <port>\n", argv[0]);

  int listenfd = Open_listenfd(argv[1], LISTENQ);

  while (1) {
    socklen_t clientlen = sizeof(struct sockaddr_storage);
    struct sockaddr_storage clientaddr;
    client_t *client;
    pthread_t tid;
 
    client = Malloc(sizeof(client_t));
    client->connfd = Accept(listenfd, (SA *)&clientaddr, &clientlen);
    Pthread_create(&tid, NULL, thread, client);
  }
}
