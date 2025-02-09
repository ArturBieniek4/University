#[1] Wyznacz najmniejszą spośród czterech liczb
#Specyfikacja wejścia: 4 liczby całkowite a1, a2, a3, a4
#Specyfikacja wyjścia: Jedna liczba całkowita a_min, <= niż wszystkie liczby
#Rozmiar danych: wejście - 4 liczby całkowite, wyjście - jedna liczba całkowita
#Złożoność czasowa: 4
a1, a2, a3, a4=4, 4, 4, 1
def algorytm():
    if a1<a2:
        if a1<a3:
            if a1<a4:
                return a1
            else:
                return a4
        else:
            if a3<a4:
                return a3
            else:
                return a4
    else:
        if a2<a3:
            if a2<a4:
                return a2
            else:
                return a4
        else:
            if a3<a4:
                return a3
            else:
                return a4
print(algorytm())