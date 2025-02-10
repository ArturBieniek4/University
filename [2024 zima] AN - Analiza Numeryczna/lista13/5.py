import numpy as np

def romberg_integration(func, a, b, max_order):
    T = np.zeros((max_order + 1, max_order + 1))

    # Wzór trapezów dla T[m,0]
    for m in range(max_order + 1):
        n = 2**m  # Liczba przedziałów
        h = (b - a) / n  # Krok
        x = np.linspace(a, b, n + 1)
        y = func(x)
        T[m, 0] = (h / 2) * (y[0] + 2 * sum(y[1:-1]) + y[-1])

    # Tablica Romberga
    for m in range(1, max_order + 1):
        for k in range(1, m + 1):
            T[m, k] = (4**k * T[m, k - 1] - T[m - 1, k - 1]) / (4**k - 1)

    return T

def romberg_integration2(f, a, b, tol=1e-6, max_levels=10):
    R = np.zeros((max_levels, max_levels))  # Tablica Romberga
    h = b - a
    
    R[0, 0] = (h / 2) * (f(a) + f(b))
    
    for k in range(1, max_levels):
        h /= 2
        midpoint_sum = sum(f(a + (2 * i - 1) * h) for i in range(1, 2**k))
        T_2n = 0.5 * R[k-1, 0] + h * midpoint_sum
        R[k, 0] = T_2n
        
        for j in range(1, k + 1):
            R[k, j] = R[k, j-1] + (R[k, j-1] - R[k-1, j-1]) / (4**j - 1)
        
        if k > 0 and abs(R[k, k] - R[k-1, k-1]) < tol:
            return R[k, k]
    
    return R[max_levels-1, max_levels-1]  # Jeśli nie osiągnięto dokładności

def f1(x):
    return 2025 * x**7 - 2006 * x**6 - 2016 * x**2

def f2(x):
    return 1 / (1 + 25 * x**2)

def f3(x):
    return np.cos(3 * x + np.pi / 4)

a1, b1 = -5, 3
a2, b2 = -1, 1
a3, b3 = -3 * np.pi, np.pi / 6

max_order = 5

T1 = romberg_integration(f1, a1, b1, max_order)
T2 = romberg_integration(f2, a2, b2, max_order)
T3 = romberg_integration(f3, a3, b3, max_order)

np.set_printoptions(precision=6, suppress=True)

print(T1)
print()
print(T2)
print()
print(T3)

