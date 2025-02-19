[![Review Assignment Due Date](https://classroom.github.com/assets/deadline-readme-button-24ddc0f5d75046c5622901739e7c5dd533143b0c8e959d652212380cedb1ea36.svg)](https://classroom.github.com/a/_MklVF_k)
Odwracanie wektora bitów
===

W pliku `bitrev.s` zaprogramuj w asemblerze `x86-64` procedurę o sygnaturze
`uint64_t bitrev(uint64_t)`. Dla danego słowa maszynowego składającego się z
bitów <tt>b<sub>n-1</sub>...b<sub>0</sub></tt> procedura ma wyznaczyć jego
lustrzane odbicie tak, że dla każdego `i` zachodzi <tt>r<sub>i</sub> =
b<sub>(n-1)-i</sub></tt>, gdzie `r` jest wynikiem działania. Rozwiązanie ma
działać w złożoności `O(log n)`, gdzie `n` jest długością słowa maszynowego
w bitach.


### Ważne

1. Można używać wyłącznie instrukcji arytmetyczno-logicznych poznanych na
   wykładzie i ćwiczeniach.
2. Użycie instrukcji `bswap` i instrukcji sterujących (poza `ret`) jest
   niedozwolone!
3. Modyfikowanie innych plików niż `bitrev.s` jest niedozwolone!
4. Twoje rozwiązanie nie może być dłuższe niż 48 instrukcji.
5. Pełną liczbę punktów można uzyskać wyłącznie za rozwiązanie, które jest
   nie dłuższe niż 32 instrukcje. Dokładniejsze informacje można znaleźć
   w pliku `.github/classroom/autograding.json`.
6. Za rozwiązanie spełniające powyższe oraz dodatkowe wymogi określone
   w pliku `Makefile`, można uzyskać punkt bonusowy.


### Pamiętaj:

1. Podpisz się w treści rozwiązania.
2. Nie zamykaj _Pull Request_ o nazwie _Feedback_!
3. W zakładce _zmienione pliki_ (ang. _changed files_) _Pull Request_ o nazwie
   _Feedback_ ma być widać wyłącznie treść Twojego rozwiązania!
