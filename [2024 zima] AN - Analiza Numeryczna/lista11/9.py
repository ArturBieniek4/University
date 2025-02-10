import pandas as pd
import numpy as np
from scipy.optimize import curve_fit
import matplotlib.pyplot as plt

data = pd.read_csv('covid.csv')

def model(x, L, k, x0, a, b):
    logistic_part = L / (1 + np.exp(-k * (x - x0)))
    polynomial_part = a*x**4+b*x**3
    return logistic_part + polynomial_part

x_real = np.arange(len(data))
y_real = data['ActiveCases'].values

initial_guess = [max(y_real), 0.1, len(data) // 2, 0.1, 0.5]
params_real, covariance_real = curve_fit(model, x_real, y_real, p0=initial_guess, maxfev=5000000)

L_real, k_real, x0_real, a_real, b_real = params_real

y_fit_real = model(np.arange(1000), L_real, k_real, x0_real, a_real, b_real)

plt.figure(figsize=(12, 7))
plt.xlim(0, 1000)
plt.scatter(x_real, y_real, label='Rzeczywiste dane: aktywne przypadki', color='blue', alpha=0.6)
plt.plot(np.arange(1000), y_fit_real, label='Dopasowany model: Logistyczny + Polinomial', color='red')
plt.title('Dopasowanie uproszczonego modelu do rzeczywistych danych o pandemii')
plt.xlabel('Dni od pierwszego przypadku (indeks wiersza)')
plt.ylabel('Liczba aktywnych przypadków')
plt.legend()
plt.grid(True)
plt.show()

print(f"Fitted parameters: L = {L_real:.2f}, k = {k_real:.4f}, x0 = {x0_real:.2f}, a = {a_real:.6f}, b = {b_real:.6f}")
