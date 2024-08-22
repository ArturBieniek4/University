t=int(input())
for tcase in range(t):
    triangle=[]
    for i in range(3):
        triangle.append(tuple(map(int, input().split())))
    triangle.sort(key=lambda x:(x[1],x[0]))
    if triangle[1][1]==triangle[2][1]:
        print(triangle[2][0]-triangle[1][0])
    else:
        print(0)
    #print(triangle)
