n, rev, neg = map(int, input().split())
bity=input()
bloczki=0
bloczek=False
for b in bity:
    if b=='0':
        if not bloczek:
            bloczek=True
            bloczki+=1
    else:
        bloczek=False
#print(bloczki)
print(max(0,min(bloczki*neg, (bloczki-1)*rev+neg)))
