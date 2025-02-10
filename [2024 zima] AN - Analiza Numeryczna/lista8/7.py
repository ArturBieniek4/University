import numpy as np
import matplotlib.pyplot as plt

x = np.array([15.5, 12.5, 8, 10, 7, 4, 8, 10, 9.5, 14, 18, 17, 22, 25, 19,
              24.5, 23, 17, 16, 12.5, 16.5, 21, 17, 11, 5.5, 7.5, 10, 12])
y = np.array([32.5, 28.5, 29, 33, 33, 37, 39.5, 38.5, 42, 43.5, 42, 40, 41.5, 
              37, 35, 33.5, 29.5, 30.5, 32, 19.5, 24.5, 22, 15, 10.5, 2.5, 
              8, 14.5, 20])

t = np.linspace(0, 1, len(x))

def NIFS3(t, values):
    n = len(values) - 1
    h = [t[i]-t[i-1] for i in range(1, n+1)]
    dk = [0 for i in range(n)]
    mid = [1 for i in range(n+1)]
    p = [0 for i in range(n)]
    q = [0 for i in range(n+1)]
    
    for i in range(1, n):
        dk[i] = (3 / h[i]) * (values[i + 1] - values[i]) - (3 / h[i - 1]) * (values[i] - values[i - 1])
    
    # Rozwiązywanie układu równań trójprzekątniowych
    for i in range(1, n):
        mid[i] = 2 * (t[i + 1] - t[i - 1]) - h[i - 1] * p[i - 1]
        p[i] = h[i] / mid[i]
        q[i] = (dk[i] - h[i - 1] * q[i - 1]) / mid[i]
    
    c = [0 for i in range(n+1)]
    b = [0 for i in range(n)]
    d = [0 for i in range(n)]
    a = [0 for i in range(n)]

    for j in range(n - 1, -1, -1):
        a[j] = values[j]
        c[j] = q[j] - p[j] * c[j + 1]
        b[j] = (values[j + 1] - values[j]) / h[j] - h[j] * (c[j + 1] + 2 * c[j]) / 3
        d[j] = (c[j + 1] - c[j]) / (3 * h[j])
    
    return a, b, c, d

def oblicz(t, knots, a, b, c, d):
    for i in range(len(knots) - 1):
        if knots[i] <= t < knots[i + 1]:
            dt = t - knots[i]
            return a[i] + b[i] * dt + c[i] * dt**2 + d[i] * dt**3
    return None

M = 600
u_values = np.linspace(0, 1, M)

a_x, b_x, c_x, d_x = NIFS3(t, x)
a_y, b_y, c_y, d_y = NIFS3(t, y)

sx_vals = [oblicz(u, t, a_x, b_x, c_x, d_x) for u in u_values]
sy_vals = [oblicz(u, t, a_y, b_y, c_y, d_y) for u in u_values]

plt.plot(sx_vals, sy_vals)
plt.scatter(x, y, color='red')
plt.xlabel('sx(t)')
plt.ylabel('sy(t)')
plt.show()
