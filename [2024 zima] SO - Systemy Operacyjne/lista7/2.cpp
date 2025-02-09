#include <bits/stdc++.h>
#include <sys/mman.h>
#include <sys/wait.h>
#include <fcntl.h>

using namespace std;

#define MEM_LEN 10

void testmem(void * mem)
{
    cout<<"("<<getpid()<<")"<<mem<<"\n";
    for(int i=0; i<MEM_LEN; i++)
    {
        cout<<((long long *)(mem))[i]<<", ";
    }
    cout<<"\n";
    for(int i=0; i<MEM_LEN; i++)
    {
        ((long long *)(mem))[i]=i;
    }
    for(int i=0; i<MEM_LEN; i++)
    {
        cout<<((long long *)(mem))[i]<<", ";
    }
    cout<<"\n\n";
}

int main()
{
    void * mem;
    int child;

    cout<<"PRIVATE ANONYMOUS: ";
    fflush(stdout);
    mem = mmap(NULL, MEM_LEN, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0);
    child = fork();
    testmem(mem);
    fflush(stdout);
    if(child) _exit(0);
    else wait(NULL);
    munmap(mem, MEM_LEN);

    cout<<"SHARED ANONYMOUS: ";
    fflush(stdout);
    mem = mmap(NULL, MEM_LEN, PROT_READ|PROT_WRITE, MAP_SHARED|MAP_ANONYMOUS, -1, 0);
    child = fork();
    testmem(mem);
    fflush(stdout);
    if(child) _exit(0);
    else wait(NULL);
    munmap(mem, MEM_LEN);
    
    int fd = open("2.file", O_RDWR, 0);
    ftruncate(fd, MEM_LEN*sizeof(long *)); // powiększa/zmniejsza plik do rozmiaru pamięci

    cout<<"PRIVATE FILE: ";
    fflush(stdout);
    mem = mmap(NULL, MEM_LEN, PROT_READ|PROT_WRITE, MAP_PRIVATE, fd, 0);
    child = fork();
    testmem(mem);
    fflush(stdout);
    if(child) _exit(0);
    else wait(NULL);
    munmap(mem, MEM_LEN);

    cout<<"SHARED FILE: ";
    fflush(stdout);
    mem = mmap(NULL, MEM_LEN, PROT_READ|PROT_WRITE, MAP_SHARED, fd, 0);
    child = fork();
    testmem(mem);
    fflush(stdout);
    if(child) _exit(0);
    else wait(NULL);
    munmap(mem, MEM_LEN);

    return 0;
}