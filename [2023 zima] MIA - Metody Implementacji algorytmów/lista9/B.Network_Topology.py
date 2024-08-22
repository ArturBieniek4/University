n,e=map(int,input().split())
graf=[0 for i in range(n)]
for i in range(e):
    a,b=map(int,input().split())
    a-=1
    b-=1
    graf[a]+=1
    graf[b]+=1
#print(graf)
ilepolaczen={}
for v in graf:
    if v not in ilepolaczen:
        ilepolaczen[v]=0
    ilepolaczen[v]+=1
#print(ilepolaczen)
if len(ilepolaczen)==2 and 1 in ilepolaczen and ilepolaczen[1]==2:
    print("bus topology")
elif len(ilepolaczen)==1 and 2 in ilepolaczen:
    print("ring topology")
elif len(ilepolaczen)==2 and 1 in ilepolaczen and n-1 in ilepolaczen:
    print("star topology")
else:
    print("unknown topology")
