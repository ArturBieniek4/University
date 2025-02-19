/*
 * UWAGA! W poniższym kodzie należy zawrzeć krótki opis metody rozwiązania
 *        zadania. Będzie on czytany przez sprawdzającego. Przed przystąpieniem
 *        do rozwiązywania zapoznaj się dokładnie z jego treścią. Poniżej należy
 *        wypełnić oświadczenie o samodzielnym wykonaniu zadania.
 *
 * Oświadczam, że zapoznałem(-am) się z regulaminem prowadzenia zajęć
 * i jestem świadomy(-a) konsekwencji niestosowania się do podanych tam zasad.
 *
 * Imię i nazwisko, numer indeksu: Artur Bieniek, 347165
 */
        .text
        .globl  bitrev
        .type bitrev, @function

/*
 * W moim rozwiązaniu używam następującej techniki: Dziel i zwyciężaj + używanie rotate
 */

bitrev:

        # triki z rozmiarami rejestrów i instrukcją rotate żeby zbić liczbę instrukcji
        # dzięki podziale na 2 rejestry można łatwo na nich operować + dostajemy za darmo swapa 32 bitów

        mov %edi, %eax # zerujemy starsze 32 bity
        rol $8, %ax # odwracamy najmłodsze 16
        rol $16, %eax # odwracamy najmłodsze 32
        rol $8, %ax # odwracamy najmłodsze 16, ale teraz to są de facto bity 32-16
        shl $32, %rax # 32 najmłodsze poodwracane dajemy jako 32 starsze

        shr $32, %rdi # 32 najstarsze na miejsce 32 najmłodszych
        rol $8, %di # odwracamy najmłodsze 16, ale teraz to są de facto bity 48-32
        rol $16, %edi # odwracamy najmłodsze 32
        rol $8, %di # odwracamy najmłodsze 16, ale teraz to są de facto bity 64-48
        or %rdi, %rax

        # dalej standardowy algorytm typu dziel i rządź
        mov     %rax, %rdx
        mov $0xF0F0F0F0F0F0F0F0, %r8
        andq %r8, %rdx
        shl $4, %rax
        shr $4, %rdx
        andq %r8, %rax
        orq %rdx, %rax

        mov     %rax, %rdx
        mov $0xCCCCCCCCCCCCCCCC, %r8
        andq %r8, %rdx
        mov $0x3333333333333333, %r8
        andq %r8, %rax
        shr $2, %rdx
        lea (%rdx, %rax, 4), %rax # rdx=rdx+rax<<2, ta jedna instrukcja zastępuje shl i or, obie liczby są zandowane z odpowiednimi maskami więc dodawanie jest równoznaczne z orem

        mov     %rax, %rdx
        mov $0xAAAAAAAAAAAAAAAA, %r8
        andq %r8, %rdx
        mov $0x5555555555555555, %r8
        andq %r8, %rax
        shr $1, %rdx
        lea (%rdx, %rax, 2), %rax

        ret

        .size bitrev, .-bitrev
