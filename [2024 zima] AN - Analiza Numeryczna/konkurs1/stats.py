# Program obliczający podsumowanie danych do zadania
# Użycie: python3 stats.py > konkurs-I-347165-podsumowanie.txt

numcurves=0
numpoints=0
numu=0
with open("konkurs-I-347165-dane.txt") as fin:
    for line in fin:
        line = line.split("[")
        if len(line)<4: continue
        line=[list(map(float, tab[:tab.find(']')].split(','))) for tab in line if "]" in tab]
        x,y,t,u = line
        numcurves+=1
        numpoints+=len(x)
        numu+=len(u)
print(numcurves, numpoints, numu, sep=", ")