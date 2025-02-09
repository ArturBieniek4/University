ax,ay,bx,by,cx,cy = map(int, input().split())
if (by-ay)*(cx-bx)!=(bx-ax)*(cy-by) and (by-ay)**2+(bx-ax)**2==(cy-by)**2+(cx-bx)**2:
    print("Yes")
else:
    print("No")
