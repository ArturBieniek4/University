__thread long myid;
static char **strtab;

void *thread(void *vargp) {
myid = *(long *)vargp;
static int cnt = 0;
printf("[%ld]: %s (cnt=%d)\n", myid, strtab[myid], ++cnt);
return NULL;
}

int main(int argc, char *argv[]) {
...
strtab = argv;
while (argc > 0) {
myid = --argc;
pthread_create(&tid, NULL, thread, (void *)&myid);
}
...
}