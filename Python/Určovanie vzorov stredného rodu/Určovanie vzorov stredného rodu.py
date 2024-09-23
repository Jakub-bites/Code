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
print('Napíšte predposledné písmeno slova ktoreho chcete určiť vzor a stlačte ENTER')
time.sleep(1)
predposledné_pismeno = input('>>>')
time.sleep(2)
print('Napíšte posledné písmeno slova ktoreho chcete určiť vzor a stlačte ENTER')
time.sleep(1)
posledné_písmeno = input('>>>')
time.sleep(4)
if predposledné_pismeno == 'U':
    if posledné_písmeno == 'M':
        print('Vzor slova je MESTO')
        exit()
if posledné_písmeno == 'O':
    print('Vzor slova je MESTO')
    exit()
if predposledné_pismeno == 'I':
    if posledné_písmeno == 'E':
        print('Vzor slova je VÝSVEDČENIE')
        exit()
if posledné_písmeno == 'E' :
    print('Vzor slova je SRDCE')
    exit()
if posledné_písmeno == 'A':
    print('Vzor slova je DIEVČA')
    exit()
print('Toto slovo určite nieje stredného rodu.')
time.sleep(10)