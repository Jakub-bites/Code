import time
print('==== VZORY STREDNÉHO RODU ====')
print('')
time.sleep(1)
print('V tomto programe píšte vždy VEĽKÝMY písmenami a BEZ INTERPUNKČNÝCH ZNAMIENOK')
time.sleep(1)
print('UPOZORNENIE! Ak nezadate slovo stredného rodu môže fungovať nesprávne')
time.sleep(1)
print('UPOZORNENIE! Slová sa musia zadávat v základnom tvare')
print('')
time.sleep(2)
print('Zadajte slovo')
time.sleep(1)
slovo = input('>>>')
time.sleep(4)
if slovo[-2] == 'U':
    if slovo[-1] == 'M':
        print('Vzor slova je MESTO')
        exit()
if slovo[-1] == 'O':
    print('Vzor slova je MESTO')
    exit()
if slovo[-2] == 'I':
    if slovo[-1] == 'E':
        print('Vzor slova je VYSVEDČENIE')
        exit()
if slovo[-1] == 'E' :
    print('Vzor slova je SRDCE')
    exit()
if slovo[-1] == 'A':
    print('Vzor slova je DIEVČA')
    exit()
print('Toto slovo určite nieje stredného rodu.')
time.sleep(10)