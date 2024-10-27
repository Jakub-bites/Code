@echo off
chcp 65001 > nul
title .webp to .jpg converter

rem Inštalácia aktualizácií
echo Kontrolujú sa aktualizácie...
winget update winget > nul
winget update winget > nul
winget install ffmpeg > nul
winget update ffmpeg > nul
winget upgrade ffmpeg > nul

start webp-To-jpg.bat
exit /b 0