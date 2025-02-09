#[1] Wyznacz najmniejszą i największą spośród czterech liczb
#Specyfikacja wejścia: 4 liczby całkowite a1, a2, a3, a4
#Specyfikacja wyjścia: Dwie liczby całkowite a_min<= niż wszystkie liczby, a_max >= niż wszystkie liczby
#Rozmiar danych: wejście - 4 liczby całkowite, wyjście - 2 liczby całkowite
#Złożoność czasowa: 10
a1, a2, a3, a4=4, 4, 4, 1
def algorytm():
    najmniejsza=a1
    najwieksza=a1
    if a2<najmniejsza: najmniejsza=a2
    if a3<najmniejsza: najmniejsza=a3
    if a4<najmniejsza: najmniejsza=a4
    if a2>najwieksza: najwieksza=a2
    if a3>najwieksza: najwieksza=a3
    if a4>najwieksza: najwieksza=a4
    return najmniejsza, najwieksza
print(algorytm())