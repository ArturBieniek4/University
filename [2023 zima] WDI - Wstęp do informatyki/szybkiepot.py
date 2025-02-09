mnozenia=0
def pot(a, b):
	global mnozenia
	rez = 1
	while b>0:
		if b%2:
			rez = rez * a
			mnozenia+=1
		b = b // 2
		a = a * a
	return rez
k=10
maxmnozenia=0
maxb=0
for b in range(2**k, 2**(k+1)+1):
	mnozenia=0
	print(b, pot(2,b), mnozenia)
	if mnozenia>maxmnozenia:
		maxmnozenia=mnozenia
		maxb=b
print(maxmnozenia, maxb)
