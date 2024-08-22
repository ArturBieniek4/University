def kolko(n):
    return "\n".join(["".join(["#" if ((x-(n-1)/2)**2+(y-(n-1)/2)**2<=(n/2)**2) else " " for x in range(n)]) for y in range(n)])
print(" "*4+kolko(7).replace("\n", "\n"+" "*4))
print(" "*3+kolko(9).replace("\n", "\n"+" "*3))
print(kolko(15))