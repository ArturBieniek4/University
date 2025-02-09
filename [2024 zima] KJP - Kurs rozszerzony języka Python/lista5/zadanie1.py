import re
import urllib.request

adres = re.compile('http(s)://([a-zA-Z]+.)*[a-zA-Z]+')

def crawl(start_page, distance, action, skippages=set()):
    if distance==0: return
    if start_page in skippages: return
    skippages.add(start_page)
    try:
        with urllib.request.urlopen(start_page) as f:
            tekst = f.read().decode('utf-8')
    except:
        return
    yield start_page, action(tekst)
    for url in adres.finditer(tekst):
        subres=crawl(url.group(), distance-1, action, skippages)
        if subres==None: continue
        for sr in subres:
            yield sr
for url, wynik in crawl("http://www.ii.uni.wroc.pl", 2, lambda tekst : 'Python' in tekst):
    print(f"{url}: {wynik}")