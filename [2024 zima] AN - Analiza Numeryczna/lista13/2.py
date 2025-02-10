def calculate_integral(f, a, b, epsilon):
    # Stała M dla oszacowania |f''(x)|
    M = 2025
    # Długość przedziału
    L = b - a
    # Wyznacz liczbę przedziałów n
    n = int(((M * L**3) / (12 * epsilon))**(1/2))
    # Oblicz krok h
    h = L / n
    # Zastosuj regułę trapezów
    integral = 0.5 * f(a) + 0.5 * f(b)
    for i in range(1, n):
        integral += f(a + i * h)
    integral *= h
    return integral

def f(x):
    return 2023*x**2

print(calculate_integral(f, -3, 5, 0.001))
