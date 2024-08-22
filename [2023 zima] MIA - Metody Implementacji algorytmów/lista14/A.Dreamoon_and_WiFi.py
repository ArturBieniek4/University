s1=input()
s2=input()
shouldbe=0
yes=0
no=0
n=len(s1)
for c in s1:
    if c=="+":
        shouldbe+=1
    else:
        shouldbe-=1

actsetting=[0 for i in range(len(s1))]
act=0
def solve(depth):
    global act,actsetting,yes,no
    if depth==n:
        if act==shouldbe:
            yes+=1
        else:
            no+=1
        return
    else:
        if s2[depth]=='+':
            actsetting[depth]='+'
            act+=1
            solve(depth+1)
            act-=1
        elif s2[depth]=='-':
            actsetting[depth]='-'
            act-=1
            solve(depth+1)
            act+=1
        elif s2[depth]=='?':
            actsetting[depth]='-'
            act-=1
            solve(depth+1)
            act+=1

            actsetting[depth]='+'
            act+=1
            solve(depth+1)
            act-=1
        else:
            raise Exception("xd")
solve(0)
print(yes/(yes+no))
# for i in range(len(s1)):
#     c1=s1[i]
#     c2=s2[i]
