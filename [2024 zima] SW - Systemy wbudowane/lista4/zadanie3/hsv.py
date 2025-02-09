import colorsys
print("uint8_t color[][3]={")
for i in range(256):
    r,g,b=colorsys.hsv_to_rgb(1.0*i/255,1,1)
    r=int(r*255)
    g=int(g*255)
    b=int(b*255)
    print(str((r,g,b)).replace("(", "{").replace(")", "},"))
print("}")