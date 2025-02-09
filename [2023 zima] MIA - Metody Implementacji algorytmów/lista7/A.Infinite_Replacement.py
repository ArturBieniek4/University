q=int(input())
for z in range(q):
    s1=input()
    s2=input()
    if s2=='a': print('1')
    elif 'a' in s2:
        print('-1')
    else:
        print(2**len(s1))
