t=int(input())
for testnum in range(t):
    tablica=[]
    n,m=map(int,input().split())
    for rownum in range(n):
        row=list(map(int,input().split()))
        tablica.append(row)
    maxsuma=0
    for startrow in range(n):
        for startcol in range(m):
            suma=tablica[startrow][startcol]
            #print('start', startrow, startcol, tablica[startrow][startcol])
            row=startrow-1
            col=startcol-1
            while row>=0 and col>=0:
                suma+=tablica[row][col]
                #print('+', tablica[row][col])
                row-=1
                col-=1
            row=startrow-1
            col=startcol+1
            while row>=0 and col<m:
                suma+=tablica[row][col]
                #print('+', tablica[row][col])
                row-=1
                col+=1
            row=startrow+1
            col=startcol-1
            while row<n and col>=0:
                suma+=tablica[row][col]
                #print('+', tablica[row][col])
                row+=1
                col-=1
            row=startrow+1
            col=startcol+1
            while row<n and col<m:
                suma+=tablica[row][col]
                #print('+', tablica[row][col])
                row+=1
                col+=1
            #print(suma, startrow, startcol)
            maxsuma=max(suma,maxsuma)
    print(maxsuma)
    #print(tablica)
