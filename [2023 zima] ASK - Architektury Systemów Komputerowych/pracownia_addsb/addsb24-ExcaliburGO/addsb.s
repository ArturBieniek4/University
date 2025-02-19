/*
 * UWAGA! W poniższym kodzie należy zawrzeć krótki opis metody rozwiązania
 *        zadania. Będzie on czytany przez sprawdzającego. Przed przystąpieniem
 *        do rozwiązywania zapoznaj się dokładnie z jego treścią. Poniżej należy
 *        wypełnić oświadczenie o samodzielnym wykonaniu zadania.
 *
 * Oświadczam, że zapoznałem(-am) się z regulaminem prowadzenia zajęć
 * i jestem świadomy(-a) konsekwencji niestosowania się do podanych tam zasad.
 *
 * Imię i nazwisko, numer indeksu: __________ __________, ______
 */

        .text
        .globl  addsb
        .type   addsb, @function

/*
 * W moim rozwiązaniu używam następującej techniki: ____ ____ ____ ____
 */

addsb:
        mov %rdi, %rdx
        mov %rsi, %rcx
        mov %0x00000000000000FF, %r8
        and %r8, %rdx
        and %r8, %rcx
        add %rdx, %rcx
        
        lea	(%rdi, %rsi), %rax
        ret

        .size   addsb, .-addsb
