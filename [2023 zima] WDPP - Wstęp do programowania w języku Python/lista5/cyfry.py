from duze_cyfry import daj_cyfre

def print_DLC(n):
    return '\n'.join([' '.join([daj_cyfre(int(c))[l] for c in str(n)]) for l in range(5)])

#print(print_DLC(432))