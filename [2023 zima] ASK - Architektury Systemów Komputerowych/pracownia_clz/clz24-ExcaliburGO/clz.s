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
        .globl  clz
        .type   clz, @function

/*
 * W moim rozwiązaniu używam następującej techniki: Schemat hornera po ilości zer wiodących tj. składanie liczby zer z kolejnych potęg 2
 */

/*
Rejestry:
%rdi - zmienna x z wejścia, tam zawsze będzie "aktualny x" czyli x ze zdjętymi ilomaś największymi potęgami dwójki
%rax - wyjście, tam zawsze będzie aktualny wynik
%rdx - tymczasowa do nowego x
%r10 - tymczasowa na nowy wynik
%r11 - tymczasowa na consty
*/
clz:
        movq $0, %rax

        movq %rdi, %rdx
        shl $32, %rdx # x << 32
        movq $32, %r10 # 32
        movq $0xFFFFFFFF, %r11
        cmpq %rdi, %r11
        cmovae %r10, %rax # możemy sobie tu pozwolić na wrzucenie 32 a nie żadne dodawanie, bo w tym momencie rax może być tylko zerem.
        cmovae %rdx, %rdi

        movq %rdi, %rdx
        shl $16, %rdx
        leaq 16(%rax), %r10 # %rax+16
        movq $0xFFFFFFFFFFFF, %r11
        cmpq %rdi, %r11
        cmovae %r10, %rax
        cmovae %rdx, %rdi

        movq %rdi, %rdx
        shl $8, %rdx
        leaq 8(%rax), %r10
        movq $0xFFFFFFFFFFFFFF, %r11
        cmpq %rdi, %r11
        cmovae %r10, %rax
        cmovae %rdx, %rdi

        movq %rdi, %rdx
        shl $4, %rdx
        leaq 4(%rax), %r10
        movq $0xFFFFFFFFFFFFFFF, %r11
        cmpq %rdi, %r11
        cmovae %r10, %rax
        cmovae %rdx, %rdi

        movq %rdi, %rdx
        shl $2, %rdx
        leaq 2(%rax), %r10
        movq $0x3FFFFFFFFFFFFFFF, %r11
        cmpq %rdi, %r11
        cmovae %r10, %rax
        cmovae %rdx, %rdi

        movq %rdi, %rdx
        shl $1, %rdx
        leaq 1(%rax), %r10
        movq $0x7FFFFFFFFFFFFFFF, %r11
        cmpq %rdi, %r11
        cmovae %r10, %rax
        cmovae %rdx, %rdi

        # na koniec trzeba jeszcze rozważyć przypadek gdzie cała liczba jest zerem
        movq $64, %r10
        test %rdi, %rdi
        cmovz %r10, %rax

        ret

        .size   clz, .-clz
