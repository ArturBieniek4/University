import numpy as np
import matplotlib.pyplot as plt
from typing import List, Tuple


def initialize_P0(xs: List[float], N) -> Tuple[np.ndarray, float, float]:
    """Inicjalizuje P_0(x) = 1 i oblicza jego iloczyny skalarne"""
    values = np.ones(N + 1)       # P_0(x) = 1
    dot_product = N               # <1, 1> = N
    x_dot_product = sum(xs[:-1])  # <x, 1> = sum(x_i)
    return values, dot_product, x_dot_product

def calculate_P1(xs: List[float], N: int, c: float) -> Tuple[np.ndarray, float, float]:
    """Oblicza P_1(x) = x - c i jego iloczyny skalarne"""
    values = np.array([x - c for x in xs])
    dot_product = np.dot(values[:N], values[:N])
    x_dot_product = np.dot(values[:N], values[:N] * xs[:N])
    return values, dot_product, x_dot_product

def calculate_next_P(xs: List[float], N: int, k: int, P: np.ndarray, 
                    c: float, d: float) -> Tuple[np.ndarray, float, float]:
    """Oblicza P_k i jego iloczyny skalarne na podstawie P_{k-1} i P_{k-2}"""
    values = np.zeros(N + 1)
    for i in range(N + 1):
        values[i] = (xs[i] - c) * P[k-1][i] - d * P[k-2][i]
    
    dot_product = np.dot(values[:N], values[:N])
    x_dot_product = np.dot(values[:N], values[:N] * xs[:N])
    return values, dot_product, x_dot_product

def orthogonal_base(n: int, x: float, xs: list) -> np.ndarray:
    """Tworzy bazę wielomianów ortogonalnych {P_k} stopnia ≤ n
    
    Każdy wiersz P[k] zawiera:
    - P[k][0:N]   - wartości P_k(x_i) w punktach próbkowania
    - P[k][N]     - wartość P_k(x) w punkcie x
    - P[k][N+1]   - iloczyn skalarny <P_k, P_k>
    - P[k][N+2]   - iloczyn skalarny <xP_k, P_k>
    """
    N = len(xs)
    xs = xs.copy()
    xs.append(x)  # zachowujemy x, ale będziemy używać tylko wartości w punktach próbkowania

    P = np.zeros((n + 1, N + 3))
    dot1, dot2 = N + 1, N + 2

    # Inicjalizacja P_0
    P[0, :N+1], P[0, dot1], P[0, dot2] = initialize_P0(xs, N)

    # Obliczenie P_1
    c = P[0, dot2] / P[0, dot1]
    P[1, :N+1], P[1, dot1], P[1, dot2] = calculate_P1(xs, N, c)

    # Obliczenie pozostałych P_k
    for k in range(2, n + 1):
        c = P[k-1, dot2] / P[k-1, dot1]
        d = P[k-1, dot1] / P[k-2, dot1]
        P[k, :N+1], P[k, dot1], P[k, dot2] = calculate_next_P(xs, N, k, P, c, d)

    return P

def w_star_all(k: int, data: list) -> np.ndarray:
    """Oblicza wartości w*(x) we wszystkich punktach próbkowania za jednym razem"""
    xs, ys = map(list, zip(*data))
    
    # Używamy punktu x=0 (możemy użyć dowolny, bo i tak używamy tylko wartości w punktach próbkowania)
    P = orthogonal_base(k, x=0.0, xs=xs)
    N = len(xs)


    result = np.zeros(N)
    for i in range(k + 1):
        a_k = np.dot(P[i, :N], ys) / P[i, N + 1]
        result += a_k * P[i, :N]
    
    return result


def f(t):
    return 6.02 * (t + 3.2) * (t - 0.02) * (t + 1.7)

def interpolation_polynomial(data):
    def lamb(i, x, x_i):
        val = 1
        for j, (x_j, _) in enumerate(data):
            if i != j:
                val *= (x - x_j) / (x_i - x_j)
        return val

    def poly(x):
        val = 0
        for i, (x_i, y) in enumerate(data):
            val += y * lamb(i, x, x_i)
        return val
    return poly


def plot_approximations(data: List[Tuple[float, float]], k: int):
    """Rysuje wszystkie wykresy aproksymacji"""
    t, y = zip(*data)
    
    # Punkty pomiarowe
    plt.plot(t, y, 'bo', label='Punkty pomiarowe', markersize=3)
    
    # Funkcja teoretyczna
    plt.plot(t, [f(t_val) for t_val in t], 'r-', label='f(t)')
    
    # Interpolacja wielomianowa Lagrange'a
    poly = interpolation_polynomial(data)
    plt.plot(t, [poly(t_val) for t_val in t], 'g-', label='Interpolacja')
    
    # Teraz liczymy w* tylko raz dla wszystkich punktów
    y_w_star = w_star_all(k, data)
    plt.plot(t, y_w_star, 'y-', label=f'w* (k={k})')
    
    plt.xlabel('t')
    plt.ylabel('y')
    plt.grid(True)
    plt.legend()


if __name__ == "__main__":
    # Wczytaj dane
    data = []
    with open("punkty.csv", "r") as file:
        data = [(float(t), float(y)) 
                for line in file 
                for t, y in [line.split(", ")]]
    data.sort()

    # Rysuj wykresy
    plot_approximations(data, k=3)
    plt.show()