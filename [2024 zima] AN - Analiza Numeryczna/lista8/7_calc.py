# dataX = [15.5, 12.5, 8, 10, 7, 4, 8, 10, 9.5, 14, 18, 17, 22, 25, 19, 24.5, 23, 17, 16, 12.5, 16.5, 21, 17, 11, 5.5, 7.5, 10, 12]
# dataY = [32.5, 28.5, 29, 33, 33, 37, 39.5, 38.5, 42, 43.5, 42, 40, 41.5, 37, 35, 33.5, 29.5, 30.5, 32, 19.5, 24.5, 22, 15, 10.5, 2.5, 8, 14.5, 20]

dataY = [32.5, 28.5, 29, 33, 33, 37, 39.5, 38.5, 42, 43.5, 42, 40, 41.5, 37, 35, 33.5, 29.5, 30.5, 32, 19.5, 24.5, 22, 15, 10.5, 2.5, 8, 14.5, 20]
DATA_LEN = len(dataY)-1

t = [i/27 for i in range(DATA_LEN)]

h = [0]+[ dataX[i]-dataX[i-1] for i in range(1, DATA_LEN) ]
l = [0]+[ h[i]/(h[i]+h[i-1]) for i in range(1, DATA_LEN) ]
d = [0]+[ ((dataY[i]-dataY[i-1])/(dataX[i]-dataX[i-1])
    - (dataY[i+1]-dataY[i])/(dataX[i+1]-dataX[i]))
    /(dataX[i+1]-dataX[i-1]) for i in range(1, DATA_LEN-1) ]

b = [2 for i in range(DATA_LEN)]
for i in range(1,DATA_LEN):
    b[i]=2-l[i]/b[i-1]*(1-l[i])

M = [0] * DATA_LEN
for i in range(DATA_LEN - 2, 0, -1):
    M[i] = (d[i] - (1 - l[i]) * M[i + 1]) / b[i]

print(b)
print(M)
for i in range(DATA_LEN):
    print(i/27, dataX[i])