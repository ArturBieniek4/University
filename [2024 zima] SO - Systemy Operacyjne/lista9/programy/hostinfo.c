#include "csapp.h"

int main(int argc, char **argv) {
  struct addrinfo *p, *listp, hints;
  char buf[MAXLINE];
  int rc, flags;

  if (argc < 2)
    app_error("usage: %s <domain name> [service]\n", argv[0]);
  char * service;
  if(argc>=3) service = (argv[2]);
  /* Get a list of addrinfo records */
  memset(&hints, 0, sizeof(struct addrinfo));
  hints.ai_family = AF_UNSPEC; /* IPv4 only */
  hints.ai_socktype = SOCK_STREAM;
  /* Connections only */
  if ((rc = getaddrinfo(argv[1], service, &hints, &listp)) != 0)
    gai_error(rc, "getaddrinfo");
  /* Walk the list and display each IP address */
  #define SERVLEN 6
  char * port = malloc(SERVLEN);
  flags = NI_NUMERICHOST | NI_NUMERICSERV; /* Display address string instead of domain name */
  for (p = listp; p; p = p->ai_next) {
    Getnameinfo(p->ai_addr, p->ai_addrlen, buf, MAXLINE, port, SERVLEN, flags);
    printf("%s:%s\n", buf, port);
  }

  /* Clean up */
  freeaddrinfo(listp);

  return EXIT_SUCCESS;
}
