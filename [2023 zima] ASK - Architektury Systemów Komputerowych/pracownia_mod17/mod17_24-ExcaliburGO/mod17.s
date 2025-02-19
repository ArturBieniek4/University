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
        .globl  mod17
        .type   mod17, @function

/*
 * W moim rozwiązaniu używam następującej techniki: ____ ____ ____ ____
 */

mod17:
        xor     %rax,%rax
        
        mov     $0x0F0F0F0F0F0F0F0F, %rsi
        and     %rdi, %rsi
        # mamy nieparzyste pozycje w RSI
        

        ret

        .size   mod17, .-mod17
