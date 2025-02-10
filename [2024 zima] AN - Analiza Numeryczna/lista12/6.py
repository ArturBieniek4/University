import math

def computeNC(f, a, b, n):
    """
    Oblicza numeryczną całkę Newtona-Cotesa dla funkcji f na przedziale [a, b] z użyciem n punktów,
    bez korzystania z biblioteki numpy.

    Args:
        f (function): Funkcja do całkowania.
        a (float): Dolna granica całkowania.
        b (float): Górna granica całkowania.
        n (int): Liczba punktów w przedziale.

    Returns:
        float: Przybliżona wartość całki Newtona-Cotesa.
    """
    # Wyznaczenie węzłów xi równo rozmieszczonych w przedziale [a, b]
    x = [a + i * (b - a) / n for i in range(n + 1)]

    # Funkcja do obliczania wartości wielomianu za pomocą schematu Hornera
    def horner_eval(coeffs, val):
        result = 0
        for c in coeffs:
            result = result * val + c
        return result

    # Funkcja do mnożenia wielomianów (zdefiniowane przez ich współczynniki)
    def poly_multiply(p1, p2):
        degree1, degree2 = len(p1), len(p2)
        result = [0] * (degree1 + degree2 - 1)
        for i in range(degree1):
            for j in range(degree2):
                result[i + j] += p1[i] * p2[j]
        return result

    # Funkcja do podziału wielomianu przez (x - c) za pomocą schematu Hornera
    def poly_divide(poly, c):
        result = []
        remainder = 0
        for coef in poly:
            new_coef = remainder * c + coef
            result.append(new_coef)
            remainder = new_coef
        return result[:-1], remainder

    # Obliczanie wielomianu P(x) = prod_{i=0}^n (x - xi)
    def compute_P():
        P = [1]  # Wielomian stały równy 1
        for xi in x:
            P = poly_multiply(P, [1, -xi])
        return P

    P = compute_P()

    # Lista przechowująca wartości Ak
    Aks = [False for i in range(n+1)]
    # Aks2 = []
    for k in range(n//2+1):
        # Obliczanie Pk(x) = P(x) / (x - xk)
        Pk, _ = poly_divide(P, x[k])

        # Obliczanie Qk = Pk(xk)
        Qk = horner_eval(Pk, x[k])

        # Obliczanie całki z Pk(x) w przedziale [a, b]
        integral = 0
        degree = len(Pk)
        prev_a = a
        for j in range(degree):
            cj = Pk[degree - j - 1]  # Współczynniki w odwrotnej kolejności
            integral += cj * ((b ** (j + 1) - prev_a) / (j + 1))
            prev_a*=a

        # Wyznaczanie Ak
        Ak = integral / Qk
        Aks[k]=Ak
        Aks[n-k]=Ak
    # print(Aks)
    # Aks += reversed(Aks2)

    # Zsumowanie wartości Ak * f(xk) dla każdego węzła
    result = sum(Aks[k] * f(x[k]) for k in range(n + 1))

    return result

if __name__ == "__main__":
    def f1(x):
        return math.cos(x)
    def f2(x):
        return x**(-1)
    def f3(x):
        return 1/(1+x**2)
    def f4(x):
        return 1
    # for n in range(2, 50):
    #     a, b = -3, 4
    #     result = computeNC(f1, a, b, n)
    #     print(n,"cos(x) from {a} to {b}=", result)
    # for n in range(2, 26):
    #     a, b = 1, 2
    #     result = computeNC(f2, a, b, n)
    #     print(n, "x**(-1) from {a} to {b}=", result)
    # for n in range(2, 26):
    #     a, b = -5, 5
    #     result = computeNC(f3, a, b, n)
    #     print("1/(1+x**2) from {a} to {b}=", result)
    for n in range(2, 26):
        a, b = 0, 1
        result = computeNC(f4, a, b, n)
        print(n, "x**(-1) from {a} to {b}=", result)