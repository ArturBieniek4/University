n,l,x,y = map(int, input().split())
marks=list(map(int, input().split()))
was_x=False
was_y=False
marks2=set(marks)
for mark in marks:
    dist1=mark+x
    dist2=mark+y
    if dist1 in marks2: was_x=True
    if dist2 in marks2: was_y=True
toadd=[]
if not was_x:
    for mark in marks:
        if (mark+x)<=l and (mark+x+y in marks2 or mark+x-y in marks2):
            was_x=True
            was_y=True
            toadd=[mark+x]
            break
        if mark-x>=0 and (mark-x+y in marks2 or mark-x-y in marks2):
            was_x=True
            was_y=True
            toadd=[mark-x]
            break
if not was_y:
    for mark in marks:
        if mark+y<=l and (mark+y+x in marks2 or mark+y-x in marks2):
            was_x=True
            was_y=True
            toadd=[mark+y]
            break
        if mark-y>=0 and (mark-y+x in marks2 or mark-y-x in marks2):
            was_x=True
            was_y=True
            toadd=[mark-y]
            break
if not was_x:
    toadd.append(marks[0]+x)
if not was_y:
    toadd.append(marks[0]+y)
print(len(toadd))
for x in toadd:
    print(x, end=" ")
