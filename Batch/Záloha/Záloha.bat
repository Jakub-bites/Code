@echo off
chcp 65001 > nul
title Záloha
set pocitac="PC"

rem Nainštalovanie a updatovanie 7-zip a winget
winget upgrade winget > nul
winget install 7-zip > nul
winget update 7-zip > nul

rem Zistenie názvu počítača
for /f  "tokens=1,2,*" %%a in ('systeminfo ^| find "Host Name"') do (
    set pocitac=%%c
)

rem Zadanie umiestnení na zálohovanie a parametre zipovania
set /p start="Zadajte umiestnenie na zálohovanie: "
set /p ciel="Zdajte umiestnenie zálohovania: "
set /p nazov="Zadajte názov zálohy: "
choice /m "Chcete zálohu zaheslovať?" /c AN
set /p uroven="Zadajte úroven kompresie [Rychle 1-9 Ultra]: "

rem Overenie heslovania a zadanie hesla
if %errorlevel% == 1 (
    set /p heslo="Zadajte heslo: "
    set heslo=-p%heslo%
)

rem Overenie či umiestnenia existujú
if not exist %start% (
    echo Zadané umiestnenia neexistujú
    goto :zipovanie
)
if not exist %ciel% (
    echo Zadané umiestnenia neexistujú
)

:zipovanie
rem Zipovanie
cls
echo Súbor sa zálohuje
"%systemdrive%\Program Files\7-Zip\7z.exe" a "%ciel%/%pocitac%_%date:~3%_%nazov%.zip" "%start%" -mx%uroven% %heslo% > nul
cls

echo Hotovo vaše údaje sú zálohované
pause > nul
exit /b 0