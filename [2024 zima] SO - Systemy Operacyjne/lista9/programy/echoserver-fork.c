#include "csapp.h"
#include "rio.h"

#define LISTENQ 10
#define MAXCLIENTS (PAGE_SIZE / sizeof(client_t))

typedef struct client {
  pid_t pid;    /* Client process id */
  size_t nread; /* Numer of bytes received so far */
} client_t;

/* DONE: Need to define context to be used with sigsetjmp & siglongjmp. */
static jmp_buf jmpbuf;
static client_t *client = NULL;
static sig_atomic_t nclients = 0;
static size_t nread = 0; /* number of bytest received on all connections */

static client_t *findclient(pid_t pid) {
  for (int i = 0; i < MAXCLIENTS; i++)
    if (client[i].pid == pid)
      return &client[i];
  return NULL;
}

static client_t *addclient(void) {
  client_t *c = findclient(0);
  if (c) {
    c->pid = -1; /* XXX: must be filled in after fork */
    c->nread = 0;
    nclients++;
  }
  return c;
}

static void delclient(pid_t pid) {
  client_t *c = findclient(pid);
  assert(c != NULL);
  nread += c->nread;
  c->pid = 0;
  nclients--;
}

static void sigchld_handler(int sig) {
  pid_t pid;
  while((pid = wait(NULL))>0)
  {
	delclient(pid);
  }
  /* DONE: Delete clients as they die. */
}

static void sigint_handler(int sig) {
  safe_printf("[%d] Server received quit request!\n", getpid());
  siglongjmp(jmpbuf, 1);
  /* DONE: Change control flow so that it does not return to main loop. */
}

static void echo(client_t *c, int connfd) {
  size_t n;
  char buf[MAXLINE];
  rio_t rio;

  rio_readinitb(&rio, connfd);
  while ((n = rio_readlineb(&rio, buf, MAXLINE))) {
    Rio_writen(connfd, buf, n);
    c->nread += n;
    /* XXX: Uncomment line below and watch client behaviour. */
    /* exit(0); */
  }
}

int main(int argc, char **argv) {
  if (argc != 2)
    app_error("usage: %s <port>\n", argv[0]);

  sigset_t sig_mask;
  sigemptyset(&sig_mask);
  sigaddset(&sig_mask, SIGCHLD);

  Signal(SIGCHLD, sigchld_handler);
  Signal(SIGINT, sigint_handler);

  client =
    Mmap(NULL, PAGE_SIZE, PROT_READ | PROT_WRITE, MAP_ANON | MAP_SHARED, -1, 0);

  int listenfd = Open_listenfd(argv[1], LISTENQ);

  /* DONE: Wait for all clients to quit and print a message with nread. */
  if(sigsetjmp(jmpbuf, 1))
  {
    printf("[%d] Waiting for %d threads...\n", getpid(), nclients);
    while(nclients!=0) sigsuspend(NULL);
    printf("Server received %d bytes\n", nread);
    exit(0);
  }
  else while (1) {
    socklen_t clientlen = sizeof(struct sockaddr_storage);
    struct sockaddr_storage clientaddr; /* Enough space for any address */
    int connfd = Accept(listenfd, (SA *)&clientaddr, &clientlen);
    static char client_hostname[MAXLINE], client_port[MAXLINE];
    Getnameinfo((SA *)&clientaddr, clientlen, client_hostname, MAXLINE,
                client_port, MAXLINE, 0);

    sigset_t mask;
    Sigprocmask(SIG_BLOCK, &sig_mask, &mask);

    /* DONE: Start client in subprocess, close unused file descriptors. */
    pid_t pid = Fork();
    if(pid!=0)
    {
	    printf("[%d] Connected to %s:%s\n", pid, client_hostname, client_port);
	    client_t *c = addclient();
	    c->pid=pid;
    }
    else
    {
	signal(SIGINT, SIG_IGN);
	Close(listenfd);
	client_t *c = findclient(getpid());
	if(c==NULL) c = addclient();
	c->pid=getpid();
	echo(c, connfd);
	printf("[%d] Disconnected!\n", c->pid);
	exit(0);
    }

    Sigprocmask(SIG_SETMASK, &mask, NULL);
  }
}
