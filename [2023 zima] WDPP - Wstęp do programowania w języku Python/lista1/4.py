from random import choice

fragmenty = "sia je ta da pra wie nie ce ca be ba bu ko rolo waje wsie fija kura kika fra fiu fu ra ro chry kawa kwa waka tra cny dze rze rzy grzy wsze ja na ma kre dy pu pi bi gra fra dro kila laki juki fika miki fiki we wa wu ku ka ra cza cze czu czte siu by bry bre bru  gi gida gafa fago zy za zi zie zimy cima cia ciu dziu".split()

def losuj_fragment():
    return choice(fragmenty)

def losuj_haslo(n):
    haslo=""
    while len(haslo)<n:
        frag=losuj_fragment()
        #print(haslo, frag)
        l=len(frag)
        if n-(len(haslo.replace(" ", ""))+l)<2 and n-(len(haslo.replace(" ", ""))+l)!=0: continue
        haslo+=frag+" "
    return haslo
for i in range(10):
    print(losuj_haslo(8))
for i in range(10):
    print(losuj_haslo(12))