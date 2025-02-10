import numpy as np
import matplotlib.pyplot as plt

# Funkcja generująca wielomian dla zadanych węzłów
def polynomial(x, nodes):
    result = 1
    for node in nodes:
        result *= (x - node)
    return result

# Funkcja generująca węzły Czebyszewa w przedziale [a, b]
def chebyshev_nodes(a, b, n):
    return np.array([0.5 * (a + b) + 0.5 * (b - a) * np.cos((2 * k + 1) / (2 * (n + 1)) * np.pi) for k in range(n + 1)])

# Parametry
a, b = -1, 1  # przedział
x_vals = np.linspace(a, b, 1000)  # punkty do rysowania wykresów

# Pętla dla stopni wielomianów n = 4, 5, ..., 20
for n in range(4, 21):
    # Węzły równoodległe
    equidistant_nodes = np.linspace(a, b, n + 1)
    y_equidistant = [polynomial(x, equidistant_nodes) for x in x_vals]

    # Węzły Czebyszewa
    chebyshev_nodes_list = chebyshev_nodes(a, b, n)
    y_chebyshev = [polynomial(x, chebyshev_nodes_list) for x in x_vals]

    # Wykresy
    plt.figure(figsize=(12, 6))

    # Węzły równoodległe
    plt.subplot(1, 2, 1)
    plt.plot(x_vals, y_equidistant, label=f"n={n}")
    plt.title(f"Węzły równoodległe (n={n})")
    plt.xlabel("x")
    plt.ylabel("Wartość wielomianu")
    plt.grid()
    plt.legend()

    # Węzły Czebyszewa
    plt.subplot(1, 2, 2)
    plt.plot(x_vals, y_chebyshev, label=f"n={n}", color='orange')
    plt.title(f"Węzły Czebyszewa (n={n})")
    plt.xlabel("x")
    plt.ylabel("Wartość wielomianu")
    plt.grid()
    plt.legend()

    # Wyświetlenie wykresów dla aktualnego n
    plt.tight_layout()
    plt.show()
