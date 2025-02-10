import numpy as np
import matplotlib.pyplot as plt
from scipy.interpolate import CubicSpline

# (a) Definicja funkcji f
def f(t):
    return (6.02) * (t + (3.2)) * (t - (0.02)) * (t + (1.7))

# Wczytanie danych z pliku punkty.csv
data = np.loadtxt('punkty.csv', delimiter=',')
t_data, y_data = data[:, 0], data[:, 1]

# (a) Posortowanie danych, aby były rosnące
sorted_indices = np.argsort(t_data)
t_data_sorted = t_data[sorted_indices]
y_data_sorted = y_data[sorted_indices]

# Wykres funkcji f i zbioru X
t = np.linspace(np.min(t_data_sorted), np.max(t_data_sorted), 500)
f_values = f(t)

plt.figure(figsize=(10, 6))
plt.plot(t, f_values, label="Funkcja f(t)", color='blue')
plt.scatter(t_data_sorted, y_data_sorted, label="Punkty z pomiarów", color='red', s=10)
plt.xlabel("t")
plt.ylabel("y")
plt.title("Wykres funkcji f(t) i punkty pomiarowe")
plt.legend()
plt.grid()
plt.show()

# (b) Interpolacja NIFS3
cubic_spline = CubicSpline(t_data_sorted, y_data_sorted)
spline_values = cubic_spline(t)

plt.figure(figsize=(10, 6))
plt.plot(t, spline_values, label="NIFS3", color='green')
plt.scatter(t_data_sorted, y_data_sorted, label="Punkty z pomiarów", color='red', s=10)
plt.xlabel("t")
plt.ylabel("y")
plt.title("Interpolacja NIFS3")
plt.legend()
plt.grid()
plt.show()

# (c) Wielomiany optymalne w sensie aproksymacji średniokwadratowej
def least_squares_polynomial(t_data, y_data, degree):
    n = len(t_data)
    
    # Inicjalizacja macierzy wielomianów ortogonalnych
    A = np.zeros((degree + 1, n))
    A[0, :] = 1  # P0(x) ≡ 1
    
    # Współczynniki rekurencji
    c = np.zeros(degree + 1)
    d = np.zeros(degree + 1)
    
    if degree > 0:
        c[1] = np.dot(t_data, A[0, :]) / np.dot(A[0, :], A[0, :])
        A[1, :] = t_data - c[1]
    
    for k in range(2, degree + 1):
        c[k] = np.dot(t_data * A[k - 1, :], A[k - 1, :]) / np.dot(A[k - 1, :], A[k - 1, :])
        d[k] = np.dot(A[k - 1, :], A[k - 1, :]) / np.dot(A[k - 2, :], A[k - 2, :])
        A[k, :] = (t_data - c[k]) * A[k - 1, :] - d[k] * A[k - 2, :]
    # Obliczanie współczynników aproksymacji
    coeffs = np.zeros(degree + 1)
    for k in range(degree + 1):
        coeffs[k] = np.dot(y_data, A[k, :]) / np.dot(A[k, :], A[k, :])
    A = (np.vander(t_data, degree + 1, increasing=True))
    coeffs = np.linalg.lstsq(A, y_data, rcond=None)[0]
    return coeffs

def evaluate_polynomial(coeffs, t):
    return np.polyval(coeffs[::-1], t)

plt.figure(figsize=(15, 10))
for degree in range(2, 16):
    coeffs = least_squares_polynomial(t_data_sorted, y_data_sorted, degree)
    approx_values = evaluate_polynomial(coeffs, t)
    
    plt.plot(t, approx_values, label=f"Stopień {degree}")
plt.ylim(-50, 250)
plt.scatter(t_data_sorted, y_data_sorted, label="Punkty z pomiarów", color='red', s=10)
plt.xlabel("t")
plt.ylabel("y")
plt.title("Wielomiany optymalne w sensie aproksymacji średniokwadratowej")
plt.legend()
plt.grid()
plt.show()
