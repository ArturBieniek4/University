def kwadrat(n):
    for i in range(n):
       for j in range(n):   # pętla w pętli
          print ("*", end="")
       print()
      
def kwadrat2(n):
    for i in range(n):
       print (n * "#")      

print ()

for i in range(10):
    print ("Przebieg:",i)
    print (20 * "-")
    if i<5:
        kwadrat(3+2*i)
    else:
        kwadrat2(i-2)
    print()
         
     
   