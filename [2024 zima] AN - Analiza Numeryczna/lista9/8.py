import numpy as np
import matplotlib.pyplot as plt
import math

# Punkty kontrolne (x, y)
control_points = [
    (39.5, 10.5), (30, 20), (6, 6), (13, -12), (63, -12.5), (18.5, 17.5),
    (48, 63), (7, 25.5), (48.5, 49.5), (9, 19.5), (48.5, 35.5), (59, 32.5), (56, 20.5)
]

# Odpowiadające wagi
weights = [1, 2, 3, 2.5, 6, 1.5, 5, 1, 2, 1, 3, 1, 1]

# Funkcja obliczająca punkt na wymiernej krzywej Béziera
def rational_bezier(t, control_points, weights):
    n = len(control_points) - 1
    numerator = np.zeros(2)  # Wektor 2D na liczniki (x, y)
    denominator = 0.0  # Skalar dla mianownika
    
    for i, (px, py) in enumerate(control_points):
        # Współczynniki wielomianu Béziera (Bernsteina)
        B = weights[i] * comb(n, i) * (t ** i) * ((1 - t) ** (n - i))
        numerator += B * np.array([px, py])
        denominator += B
    
    return numerator / denominator  # Zwracamy współrzędne wymierne (x, y)

# Funkcja pomocnicza do obliczania współczynników kombinatorycznych
def comb(n, k):
    return math.factorial(n) // (math.factorial(k) * math.factorial(n - k))

# Generowanie punktów na krzywej dla t w [0, 1]
t_values = np.linspace(0, 1, 1000)  # 1000 punktów
curve_points = np.array([rational_bezier(t, control_points, weights) for t in t_values])

# Rysowanie krzywej i punktów kontrolnych
plt.figure(figsize=(10, 6))
plt.plot(curve_points[:, 0], curve_points[:, 1], label="Krzywa Béziera", color="blue")
control_x, control_y = zip(*control_points)
plt.scatter(control_x, control_y, color="red", label="Punkty kontrolne")
plt.plot(control_x, control_y, '--', color="gray", label="Łamana kontrolna")

# Dodanie numeracji punktów kontrolnych
for i, (x, y) in enumerate(control_points):
    plt.text(x, y, f"{i}", fontsize=10, ha="center", va="center", color="black",
             bbox=dict(facecolor='white', edgecolor='gray', boxstyle='round,pad=0.3'))


# Dodanie opisów
plt.title("Wymierna krzywa Béziera")
plt.xlabel("X")
plt.ylabel("Y")
plt.legend()
plt.grid(True)
plt.axis("equal")
plt.show()
