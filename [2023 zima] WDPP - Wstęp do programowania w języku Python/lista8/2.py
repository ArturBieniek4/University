def wystapienia(s):
    wyst={}
    for c in s:
        if c in wyst:
            wyst[c]+=1
        else: wyst[c]=1
    return wyst

def ukladalne(dest, src):
    dest=wystapienia(dest)
    src=wystapienia(src)
    for c in dest:
        if c not in src or src[c]<dest[c]:
            return False
    return True
print(ukladalne("kot", "lokomotywa"))