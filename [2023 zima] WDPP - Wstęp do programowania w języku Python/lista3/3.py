def usun_w_nawiasach(s):
    nawias=False
    sol=""
    for c in s:
        if c=='(':
            nawias=True
        elif c==')':
            nawias=False
        elif not nawias:
            sol+=c
    return sol
print(usun_w_nawiasach("Ala ma kota (perskiego)!"))
print(usun_w_nawiasach("Ala (nie) ma kota (perskiego)!"))
print(usun_w_nawiasach("()()()"))
print(usun_w_nawiasach("int main(void)"))