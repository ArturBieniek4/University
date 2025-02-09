def cessar(word, key):
    alphabet="aąbcćdeęfghijklłmnńoóprsśtuwyzźż"
    zamiana={a:alphabet[(b+key)%len(alphabet)] for a,b in zip(alphabet, range(len(alphabet)))}
    return ''.join([zamiana[letter] for letter in word])
print(cessar("abecadło", 1))