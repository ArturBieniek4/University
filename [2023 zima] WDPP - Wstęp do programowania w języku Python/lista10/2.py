slowa=set()
with open("popularne_slowa2023.txt") as f:
    for line in f:
        slowa.add(line.strip())
alphabet="aąbcćdeęfghijklłmnńoóprsśtuwyzźż"
def cessar(word, key):
    zamiana={a:alphabet[(b+key)%len(alphabet)] for a,b in zip(alphabet, range(len(alphabet)))}
    return ''.join([zamiana[letter] if letter in zamiana else letter for letter in word])

maxslowo=('','',0)
for i,slowo in enumerate(slowa):
    if i%10000==0:
        print(i/len(slowa)*100,"%")
    if len(slowo)<=len(maxslowo[0]): continue
    for k in range(1,len(alphabet)):
        slowo2=cessar(slowo,k)
        if slowo2!=slowo and slowo2 in slowa:
            #print(slowo, slowo2, k)
            if len(slowo)>=len(maxslowo[0]):
                maxslowo=(slowo,slowo2,k)
                print(maxslowo)
print(maxslowo)