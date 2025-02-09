def tabliczka(x1, x2, y1, y2, d):
    cols=int((y2-y1)//d+1)
    rows=int((x2-x1)//d+1)
    tab=[[x1+row*d]+[(x1+row*d)*(y1+col*d) for col in range(cols)] for row in range(rows)]
    tab=[[y1+col*d for col in range(cols)]]+tab # header
    maxlen=max([max([len(str(tab[row][col])) for col in range(cols)]) for row in range(rows)])
    for i,row in enumerate(tab):
        if i==0: print(maxlen*' ', end=' ')
        for cell in row:
            cell=str(cell)
            cell=(maxlen-len(cell))*' '+cell
            print(cell, end=' ')
        print("")

tabliczka(-5.123, -3.0, 2.0, 4.0, 1.777)