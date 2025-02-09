n=int(input())
k1=list(map(int,input().split()))
if n>=2: k2=list(map(int,input().split()))
if n>=3: k3=list(map(int,input().split()))
#print(k1, k2, k3)
nums=set()
for i1,n1 in enumerate(k1):
    nums.add(n1)
    if n>=2:
        for i2,n2 in enumerate(k2):
            nums.add(n1*10+n2)
            nums.add(n1+n2*10)
            nums.add(n2)
            if n>=3:
                for i3,n3 in enumerate(k3):
                    nums.add(n1*100+n2*10+n3)
                    nums.add(n1*100+n3*10+n2)
                    nums.add(n2*100+n1*10+n3)
                    nums.add(n2*100+n3*10+n1)
                    nums.add(n1*10+n2)
                    nums.add(n1*10+n3)
                    nums.add(n2*10+n1)
                    nums.add(n2*10+n3)
                    nums.add(n3*10+n1)
                    nums.add(n3*10+n2)
                    nums.add(n1)
                    nums.add(n2)
                    nums.add(n3)
                    #print(n1,n2,n3)
maxnum=1
nums.add(0)
#print(nums)
while maxnum in nums:
    maxnum+=1
print(maxnum-1)
