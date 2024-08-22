ciagi=[]
def f2(N,A,B,depth,ciag):
    if depth==N:
        ciagi.append([x for x in ciag])
        return
    for i in range(ciag[-1] if len(ciag)>0 else A, B+1):
        ciag.append(i)
        f2(N,A,B,depth+1,ciag)
        ciag.pop()
f2(3,1,3,0,[])
print(ciagi)