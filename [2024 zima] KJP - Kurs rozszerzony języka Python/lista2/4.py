

import random
def uprosc_zdanie(tekst, dl_slowa, liczba_slow):
    tekst=list(filter(lambda x: len(x)<=dl_slowa, tekst.split(" ")))
    while len(tekst)>liczba_slow:
        tekst.remove(random.choice(tekst))
    return " ".join(tekst)

tekst = "Podział peryklinalny inicjałów wrzecionowatych \
kambium charakteryzuje się ścianą podziałową inicjowaną \
w płaszczyźnie maksymalnej."
print(uprosc_zdanie(tekst, 10, 5))

import urllib.request
URL='https://www.gutenberg.org/ebooks/28296.txt.utf-8'
tekst=urllib.request.urlopen(URL).read().decode("utf-8")
print(uprosc_zdanie(tekst, 10, 5))