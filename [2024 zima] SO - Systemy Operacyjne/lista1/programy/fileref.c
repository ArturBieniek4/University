#include "csapp.h"

static char buf[256];

#define LINE1 49
#define LINE2 33
#define LINE3 78

static void do_read(int fd) {
  /* TODO: Spawn a child. Read from the file descriptor in both parent and
   * child. Check how file cursor value has changed in both processes. */
  int n;
  if(fork()!=0)
  {
    n=read(fd, buf, LINE1);
    printf("%d %d %ld %s", getpid(), n, Lseek(fd, 0, SEEK_CUR), buf);
    fflush(stdin);
  }
  else
  {
    n=read(fd, buf, LINE2);
    printf("%d %d %ld %s", getpid(), n, Lseek(fd, 0, SEEK_CUR), buf);
    fflush(stdin);
  }
  exit(0);
}

static void do_close(int fd) {
  /* TODO: In the child close file descriptor, in the parent wait for child to
   * die and check if the file descriptor is still accessible. */
  pid_t child=fork();
  int n;
  if(child)
  {
    waitpid(child, NULL, 0);
    n=read(fd, buf, LINE1);
    printf("%d %d %ld %s", getpid(), n, Lseek(fd, 0, SEEK_CUR), buf);
    fflush(stdout);
  }
  {
    close(fd);
  }
  exit(0);
}

int main(int argc, char **argv) {
  if (argc != 2)
    app_error("Usage: %s [read|close]", argv[0]);

  int fd = Open("test.txt", O_RDONLY, 0);

  if (!strcmp(argv[1], "read"))
    do_read(fd);
  if (!strcmp(argv[1], "close"))
    do_close(fd);
  app_error("Unknown variant '%s'", argv[1]);
}
