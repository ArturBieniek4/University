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
 * W moim rozwiązaniu używam następującej techniki: rozsmarowanie pierwszej jedynki na prawo i popcount na tym, to zwraca pozycję ostatniej jedynki od prawej, wystarczy odjąć 64 żeby mieć liczbę zer wiodących
 */

/*
Rejestry:
%rdi - zmienna x z wejścia, będziemy używać jej jako tymczasowej
%rax - wyjście, tam zawsze będzie aktualny wynik
%r10 - tymczasowa na consty
*/
clz:
        movq    %rdi, %rax
        shr $1, %rdi
        orq %rdi, %rax

        movq    %rax, %rdi
        shr $2, %rdi
        orq %rdi, %rax

        movq    %rax, %rdi
        shr $4, %rdi
        orq %rdi, %rax

        movq    %rax, %rdi
        shr $8, %rdi
        orq %rdi, %rax

        movq    %rax, %rdi
        shr $16, %rdi
        orq %rdi, %rax

        movq    %rax, %rdi
        shr $32, %rdi
        orq %rdi, %rax
        # cały powyższy kod rozsmarował nam pierwszą jedynkę od lewej na prawo
        
        # teraz robimy popcount, tak jak z listy 1 zadanie 2, ten usprawniony algorytm żeby się zmieścić w liczbie 50 operacji
        # x-=(x>>1)&0x5555555555555555
        mov %rax, %rdi
        shr $1, %rdi
        movq $0x5555555555555555, %r10 # trzeba takie obejście zrobić bo inaczej krzyczy o operand type mismatch do anda
        andq %r10, %rdi
        subq %rdi, %rax

        # x=(x&0x3333333333333333)+((x>>2)&0x3333333333333333)
        mov %rax, %rdi
        shr $2, %rdi
        movq $0x3333333333333333, %r10
        andq %r10, %rdi
        andq %r10, %rax
        addq %rdi, %rax

        # x=(x+(x>>4))&0x0F0F0F0F0F0F0F0F
        mov %rax, %rdi
        shr $4, %rdi
        addq %rdi, %rax
        movq $0x0F0F0F0F0F0F0F0F, %r10
        andq %r10, %rax

        # x+=(x>>8)
        mov %rax, %rdi
        shr $8, %rdi
        addq %rdi, %rax

        # x+=(x>>16)
        mov %rax, %rdi
        shr $16, %rdi
        addq %rdi, %rax

        # x+=(x>>32)
        mov %rax, %rdi
        shr $32, %rdi
        addq %rax, %rdi

        # x&=0x7F (ostatnie 7 bitów, pozwala zapisać max 64)
        andq $0x7F, %rdi

        movq $64, %rax
        subq %rdi, %rax
        ret

        .size   clz, .-clz
