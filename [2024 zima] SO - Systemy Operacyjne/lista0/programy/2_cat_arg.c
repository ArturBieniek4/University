#include "apue.h"
#include <fcntl.h>   // for open()
#include <unistd.h>  // for close()

#define BUFFSIZE 4096

int main(int argc, char *argv[]){
  int n;
  char buf[BUFFSIZE];
  int fd;

  if (argc != 2)
    err_quit("usage: cat directory_name");

  if ((fd = open(argv[1], O_RDONLY)) < 0)
    err_sys("Can't open file %s", argv[1]);

  while ((n = read(fd, buf, BUFFSIZE)) > 0)
    if (write(STDOUT_FILENO, buf, n) != n)
      err_sys("write error");

  if (n < 0)
    err_sys("read error");

  close(fd);

  exit(0);
}
