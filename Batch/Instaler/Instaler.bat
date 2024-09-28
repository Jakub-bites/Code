@echo off
chcp 65001
title Instaler

set /p Nazov=Zadajte názov aplikácie na nainštalovanie: 
echo Počkajte prosím
winget update winget > nul
cls
echo Inštaluje sa
winget install %Nazov%
choice /c YM /m Chcete updatovať všetky aplikácie na vašom počítači?
if %errorlevel% == 1 (
    echo Updatuje sa
    winget upgrade --allow-reboot --accept-package-agreements --accept-source-agreements --all > nul
)

exit /b 0