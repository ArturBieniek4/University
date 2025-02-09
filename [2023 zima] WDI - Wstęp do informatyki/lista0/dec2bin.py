def d2b(a):
	ret=""
	if a==0: return "0"
	b=1
	while b<=a:
		b*=2
	b//=2
	while(a>0):
		a-=b
		ret+="1"
		b//=2
		while(b>a):
			b//=2
			ret+="0"
	return ret
for i in range(1000000):
	wzor=bin(i)[2:]
	nasze=d2b(i)
	if(wzor==nasze): print("Test #", i, "OK", sep=" ")
	else:
		print("Test #", i, "ERROR", wzor, nasze, sep=" ")
		break

