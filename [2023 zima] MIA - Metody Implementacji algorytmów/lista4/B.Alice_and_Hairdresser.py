n,m,l=map(int,input().split())
hair=list(map(int, input().split()))
ans=0
for i,h in enumerate(hair):
    if h>l:
        if i==0 or hair[i-1]<=l:
            ans+=1
#print(ans)
for iq in range(m):
    q=input()
    if q[0]=='0':
        print(ans)     
    else:
        q,p,d=map(int,q.split())
        p-=1
        #print(p,d)
        if hair[p]<=l and hair[p]+d>l: # było <=l i powiększone do >l
            if p-1>=0 and p+1<n: # są oba
                if hair[p-1]<=l and hair[p+1]<=l: # oba <=l
                    ans+=1 # nowe cięcie
                    # print("Nowe cięcie")
                elif hair[p-1]>l and hair[p+1]>l: # oba >l
                    ans-=1 # łączymy je
                    # print("Złączenie")
                # jak jeden mniejszy to nic nie robimy
            if (p-1>=0 and p+1>=n and hair[p-1]<=l) or (p+1<n and p-1<0 and hair[p+1]<=l): # jest lewy lub prawy <=l
                ans+=1
                # print("Nowe l")
            if n==1:
                ans+=1 # był jedyny, edge case
        hair[p]+=d
#print(ans)           
