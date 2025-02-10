# Bilbioteka do obliczeń NIFS3

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