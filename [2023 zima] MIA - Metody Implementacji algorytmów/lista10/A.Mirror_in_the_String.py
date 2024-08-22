t=int(input())
for zestaw in range(t):
    n=int(input())
    s=input()
    podciag=s[0]
    i=1
    #print(i, len(s), podciag+s[i], podciag)
    if len(s)==1: print(s[0]*2)
    elif s[1]>=s[0]: print(s[0]*2)
    else:
        while i<len(s) and s[i]<=s[i-1]:
            podciag+=s[i]
            #print(podciag)
            i+=1
        print(podciag+podciag[::-1])
