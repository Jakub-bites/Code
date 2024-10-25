@echo off
chcp 65001 > nul
title Záloha Update

rem Nainštalovanie a updatovanie 7-zip a winget
winget upgrade winget > nul
winget install 7-zip > nul
winget update 7-zip > nul


rem Zadanie umiestnení na zálohovanie a parametre zipovania
set /p start="Zadajte umiestnenie na updatovanie: "
set /p ciel="Zdajte umiestnenie updatovania: "


rem Overenie či umiestnenia existujú
if not exist %start% (
    echo Zadané umiestnenia neexistujú
    goto :zipovanie
)
if not exist %ciel% (
    echo Zadané umiestnenia neexistujú
)

:zipovanie
rem Updatovanie
cls
echo Súbor sa updatuje
"%systemdrive%\Program Files\7-Zip\7z.exe" u "%ciel%" "%start%" -mx%uroven% > nul
cls

echo Hotovo vaše údaje sú updatované
pause > nul
exit /b 0