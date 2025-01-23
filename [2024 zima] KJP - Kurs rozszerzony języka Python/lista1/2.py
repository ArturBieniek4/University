def is_palindrom(text):
    text = list(filter(lambda x: x.isalpha() or x.isdigit(), text.lower()))
    return text==text[::-1]

print(is_palindrom("xd"))
print(is_palindrom("Kobyła ma mały bok."))
print(is_palindrom("Eine güldne, gute Tugend: Lüge nie!"))
print(is_palindrom("Míč omočím."))