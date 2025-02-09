
// gcc 1.c -o 1 && sudo chown root:root 1 && sudo chmod u+s 1 && ./1 1 && ./1 2 && ./1 3 && ./1 4

#define _GNU_SOURCE
#include <stdio.h>
#include <unistd.h>
#include <sys/types.h>
#include <stdlib.h>

void print_ident()
{
	uid_t ruid, euid, suid;
	getresuid(&ruid, &euid, &suid);
	printf("ruid = %d; euid = %d; suid = %d\n", ruid, euid, suid);
}

int main(int argc, char **argv)
{
	if(argc==1) return -1;
	int ncase = atoi(argv[1]);
	switch(ncase){
		case 1:
			printf("setuid(2000);\n"); setuid(2000);
			break;
		case 2:
			printf("setreuid(-1, 2000);\n"); setreuid(-1, 2000);
			break;
		case 3:
			printf("seteuid(2000);\n"); seteuid(2000);
			break;
		case 4:
			printf("setresuid(-1, 2000, 3000);\n"); setresuid(-1, 2000, 3000);
			break;
	}
	print_ident();
	return 0;
}

//setuid(2) zmienia euid
//jeżeli proces jest uprzywilejowany zmienia także ruid i suid

//setreuid(2) zmienia real i effective uid
//-1 mówi żeby nie zmieniać
//jeżeli euid jest zmieniany, to suid też

//seteuid(2) ustawia tylko euid i niczego innego nie rusza

//setresuid(2) ustawia wszystko
//jeżeli gdzieś jest -1 to nie rusza tego

// proces z tożsamością ruid=0, euid=1000, suid=1000 nie jest uprzywilejowany
// uprzywilejowany tylko i wyłącznie wtedy gdy euid=0
// ten proces został tylko wowałany przez roota, ale ma uprawnienia usera 1000
// prawdopodobnie miał bit setuid i należał do 1000
// lub zrzekł się uprawnień wywołując setreuid(-1, 1000)