import itertools

class brakWartosciZmiennej(Exception):
    def __init(self, zmienna):
        super().__init__("Brak wartości zmiennej {zmienna}")

class bladTypow(TypeError):
    def __init(self, typ):
        super().__init__("Błąd typu:", str(typ))

class bladNazwyZmiennej(Exception):
    def __init(self, nazwa):
        super().__init__("Błąd nazwy zmiennej:", str(nazwa))

class Formula():
    def __add__(self, arg):
        return Or(self, arg)
    def __mul__(self, arg):
        return And(self, arg)
    def __eq__(self, other):
        return self.__class__ == other.__class__ and self.__dict__ == other.__dict__
    def tautologia(self):
        vars = list(self.vars)
        sigma = dict.fromkeys(vars)
        for sol in itertools.product([True, False], repeat=len(vars)):
            for i,v in enumerate(sol):
                sigma[vars[i]]=v
            # print(sigma, self.oblicz(sigma))
            if not self.oblicz(sigma): return False
        return True
    def uprosc(self):
        return self

class Stala(Formula):
    def __init__(self, wartosc):
        self.vars=set()
        if wartosc==True: self.value=True
        elif wartosc==False: self.value=False
        else: raise bladTypow(wartosc)
    def __str__(self):
        return str(self.value)
    def oblicz(self, zmienne):
        return self.value
    
class Zmienna(Formula):
    def __init__(self, ident):
        if type(ident)!=str: raise bladNazwyZmiennej(ident)
        self.vars=set([ident])
        self.ident = ident
    def __str__(self):
        return self.ident
    def oblicz(self, zmienne):
        if self.ident not in zmienne:
            raise brakWartosciZmiennej(self.ident)
        if type(zmienne[self.ident])!=bool:
            raise bladTypow(type(zmienne[self.ident]))
        return zmienne[self.ident]

class SpojnikDwuarg(Formula):
    def __init__(self, f1, f2):
        self.f1=f1
        self.f2=f2
        self.vars=f1.vars.union(f2.vars)

class Or(SpojnikDwuarg):
    def oblicz(self, zmienne):
        return self.f1.oblicz(zmienne) or self.f2.oblicz(zmienne)
    def uprosc(self):
        f1=self.f1.uprosc()
        f2=self.f2.uprosc()
        if f1==Stala(True) or f2==Stala(True): return Stala(True)
        if f1==Stala(False): return f2
        if f2==Stala(False): return f1
        if f1==Not(f2) or f2==Not(f1): return Stala(True) # prawo wyłączonego środka
        return Or(f1, f2)
    def __str__(self):
        return "("+str(self.f1)+" or "+str(self.f2)+")"
    
class And(SpojnikDwuarg):
    def oblicz(self, zmienne):
        return self.f1.oblicz(zmienne) and self.f2.oblicz(zmienne)
    def uprosc(self):
        f1=self.f1.uprosc()
        f2=self.f2.uprosc()
        if f1==Stala(False) or f2==Stala(False): return Stala(False)
        if f1==Stala(True): return f2
        if f2==Stala(True): return f1
        if f1==Not(f2) or f2==Not(f1): return Stala(False)
        return And(f1, f2)
    def __str__(self):
        return "("+str(self.f1)+" and "+str(self.f2)+")"

class Not(Formula):
    def __init__(self, f):
        self.f=f
        self.vars=f.vars
    def oblicz(self, zmienne):
        return not self.f.oblicz(zmienne)
    def uprosc(self):
        f=self.f.uprosc()
        if type(f)==Not: return f.f # podwójna negacja
        if type(f)==Or: return And(Not(f.f1), Not(f.f2)) # de morgan
        if type(f)==And: return Or(Not(f.f1), Not(f.f2)) # de morgan
        return Not(f)
    def __str__(self):
        return "(not "+str(self.f)+")"

f1=Stala(False)
f2=Zmienna("x")
f3=Or(f1, f2)
print(f3.oblicz({'x': False}))
print(f3.uprosc())
f4=Or(Not(Zmienna("x")), And(Zmienna("y"), Stala(True)))
print(f4.tautologia())
f5=Or(Zmienna("p"), Not(Zmienna("p")))
print(f5.tautologia())
print(f4)
print(f4.uprosc())
print(f5.uprosc())
print(f4+f5)
print(f4*f5)
# f4.oblicz({})