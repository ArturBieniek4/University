def kompresja(tekst):
    prev=tekst[0]
    cnt=0
    wynik=[]
    for litera in tekst:
        if litera==prev:
            cnt+=1
        else:
            wynik.append((cnt, prev))
            cnt=1
            prev=litera
    wynik.append((cnt, prev))
    return wynik

def dekompresja(tekst):
    return "".join([cnt*letter for (cnt, letter) in tekst])

print(kompresja("suuuperxdd"))
print(dekompresja(kompresja("suuuuperxd")))

import urllib.request
URL='https://www.gutenberg.org/ebooks/28296.txt.utf-8'
tekst=urllib.request.urlopen(URL).read().decode("utf-8")
print(kompresja(tekst))
print(dekompresja(kompresja(tekst))==tekst)