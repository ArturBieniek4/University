#[1] Wyznacz najmniejszą i największą spośród czterech liczb
#Specyfikacja wejścia: 1 liczba całkowita - n, n liczb całkowitych
#Specyfikacja wyjścia: Jedna liczba całkowita - suma
#Rozmiar danych: wejście - n+1 liczb całkowitych, wyjście - 1 liczba całkowita
#Złożoność czasowa: 3+3*n
n=5
a=[1,2,3,4,5]
def algorytm():
    suma=0
    i=0
    while i<n:
        suma+=a[i]
        i+=1
    return suma
print(algorytm())