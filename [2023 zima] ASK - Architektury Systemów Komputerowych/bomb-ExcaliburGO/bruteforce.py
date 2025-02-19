import os

for char1 in range(1, 7):
    print(char1)
    for char2 in range(1, 7):
        for char3 in range(1, 7):
            for char4 in range(1, 7):
                for char5 in range(1, 7):
                    for char6 in range(1, 7):
                        #print(char1, char2)
                        code = (str(char1) + " " + str(char2)+ " " +str(char3) + " " + str(char4)+ " " +str(char5) + " " + str(char6)+"\n")
                        with open("in.txt", "w") as f:
                            f.write(code)
                        os.system("./bomb psol.txt < in.txt > out.txt")
                        with open("out.txt", "rb") as f:
                            text = f.read()
                            if b'Congratulations' in text:
                                break