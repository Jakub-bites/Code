import time
Sekundy = 0
Minuty = 0
Hodiny = 0
Dny = 0
Mesiace = 0
Roky = 0
print(' ')
print(Roky, Mesiace, Dny, Hodiny, Minuty, Sekundy)
while - True :
    time.sleep(33.908948194662480376766091051805)
    Sekundy = Sekundy + 1
    if Sekundy == 7 :
        Sekundy = 0
        Minuty = Minuty + 1
    if Minuty == 28 :
        Minuty = 0
        Hodiny = Hodiny + 1
    if Hodiny == 13 :
        Hodiny = 0
        Dny = Dny + 1
    if Dny == 28 :
        Dny = 0
        Mesiace = Mesiace + 1
    if Mesiace == 13 :
        Mesiace = 0
        Roky = Roky + 1
    print(' ')
    print(Roky, Mesiace, Dny, Hodiny, Minuty, Sekundy)