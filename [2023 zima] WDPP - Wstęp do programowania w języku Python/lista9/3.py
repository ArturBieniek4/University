def evaluate(formula, sigma):
    for letter in formula:
        if letter.isalpha() and letter not in sigma:
            raise Exception("Zła sigma")
    return True if eval(formula, sigma) else False

def sprawdzanie(formula):
    sigma={}
    for letter in formula:
        if letter.isalpha() and letter not in sigma:
            sigma[letter]=False
    trues=0
    falses=0
    valtrue=None
    valfalse=None
    for case in range(0, 2**(len(sigma))):
        for i,letter in enumerate(sigma):
            sigma[letter]=case%2
            case//=2
        res=evaluate(formula, sigma)
        if res:
            trues+=1
            valtrue={var: sigma[var] for var in sigma if var.isalpha()}
        else:
            falses+=1
            valfalse={var: sigma[var] for var in sigma if var.isalpha()}
    if trues==0: return "Sprzeczna"
    if falses==0: return "Tautologia"
    else: return "Spełnialna", valtrue, valfalse
sigma = {
    'p': True,
    'q': False
}

#print(evaluate("(p | q) & (~p | ~q)", {'p':False}))
print(evaluate("(p | q) & (~p | ~q)", {'p':True, 'q':True}))

print(sprawdzanie("p&(~p)"))
print(sprawdzanie("p|(~p)"))
print(sprawdzanie("p&q"))