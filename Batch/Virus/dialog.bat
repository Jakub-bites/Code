@echo off
chcp 65001 > nul
title Virus!!!

:start
echo Váš počítač bol nakazený vírusom,
echo Ak tento výrus nefunguje kontaktujte Jakuba Zápražného.
set /p heslo="Zadajte heslo pre odblokovanie výrusu: "
if %heslo% == 6321 (
    cls
    echo Heslo je správne
    explorer
) else (
    echo Heslo je nesprávne skúste to znova
    timeout /nobreak /t 5 > nul
    cls
    goto :start
)