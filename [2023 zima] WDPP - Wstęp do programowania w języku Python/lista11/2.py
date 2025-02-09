def ppn(slowo):
    litery=dict.fromkeys(slowo)
    i=1
    for litera in litery:
        litery[litera]=i
        i+=1
    ans=[]
    for litera in slowo:
        ans.append(str(litery[litera]))
    return "-".join(ans)
print(ppn("abs"))
print(ppn("tata"))
print(ppn("indianin"))