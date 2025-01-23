import re
import urllib.request
import threading
import queue

adres = re.compile('http(s)://([a-zA-Z]+.)*[a-zA-Z]+')

def worker(shared_queue, wyniki, skippages, skippages_lock):
    while True:
        item = shared_queue.get()
        # sygnał końca pracy
        if item is None:
            break
        start_page, distance, action = item

        with skippages_lock:
            if start_page in skippages:
                shared_queue.task_done()
                continue
            else: skippages.add(start_page)
        
        try:
            with urllib.request.urlopen(start_page) as f:
                tekst = f.read().decode('utf-8')
        except:
            shared_queue.task_done()
            continue
        
        wyniki.append((start_page, action(tekst)))

        if distance>1:
            for url in adres.finditer(tekst):
                shared_queue.put((url.group(), distance-1, action))
        shared_queue.task_done()

def crawl(start_page, distance, action, num_threads=32):
    shared_queue = queue.Queue()
    wyniki = []
    skippages = set()
    skippages_lock = threading.Lock()

    threads = [threading.Thread(target=worker, args=(shared_queue, wyniki, skippages, skippages_lock)) for _ in range(num_threads)]

    for th in threads: th.start()

    shared_queue.put((start_page, distance, action))

    shared_queue.join()

    for _ in threads:
        shared_queue.put(None)
    for th in threads:
        th.join()

    return wyniki

for url, wynik in crawl("http://www.ii.uni.wroc.pl", 2, lambda tekst : 'Python' in tekst):
    print(f"{url}: {wynik}")