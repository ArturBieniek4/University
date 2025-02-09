from math import exp
print("const uint8_t logscale[]={")
for i in range(256):
    print(int(((exp(i/255.0)-1)/(exp(1)-1))*255), end=",\n")
print("};")