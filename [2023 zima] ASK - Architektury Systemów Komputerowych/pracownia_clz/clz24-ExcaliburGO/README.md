[![Review Assignment Due Date](https://classroom.github.com/assets/deadline-readme-button-24ddc0f5d75046c5622901739e7c5dd533143b0c8e959d652212380cedb1ea36.svg)](https://classroom.github.com/a/xzTHDyVB)
Liczba zer wiodących
===

W pliku `clz.s` zaprogramuj w asemblerze `x86-64` procedurę o sygnaturze
`int clz(uint64_t)`, która dla danego słowa maszynowego wyznacza długość
najdłuższego prefiksu składającego się z samych zer. Rozwiązanie ma działać w
`O(log n)`, gdzie `n` jest długością słowa maszynowego.

### Ważne:

1. Można używać wyłącznie instrukcji poznanych na wykładzie i ćwiczeniach.
2. Użycie instrukcji `lzcnt` lub podobnych jest niedozwolone!
3. Modyfikowanie innych plików niż `clz.s` jest niedozwolone!
4. Twoje rozwiązanie nie powinno być dłuższe niż 50 instrukcji.
5. Pełną liczbę punktów można uzyskać wyłącznie za rozwiązanie, które nie 
używa instrukcji skoków. Dokładniejsze informacje można znaleźć w pliku 
`.github/classroom/autograding.json`.
6. Za rozwiązanie spełniające powyższe oraz dodatkowe wymogi określone 
w pliku Makefile, można uzyskać punkt bonusowy (nie jest on widoczny na 
Github).

### Pamiętaj:

1. Podpisz się w treści rozwiązania.
2. Nie zamykaj _Pull Request_ o nazwie _Feedback_!
3. W zakładce _zmienione pliki_ (ang. _changed files_) _Pull Request_ o nazwie
   _Feedback_ ma być widać wyłącznie treść Twojego rozwiązania!
