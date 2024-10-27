@echo off
chcp 65001 > nul
title .webp to .png converter

rem Inštalácia aktualizácií
echo Kontrolujú sa aktualizácie...
winget update winget > nul
winget update winget > nul
winget install ffmpeg > nul
winget update ffmpeg > nul
winget upgrade ffmpeg > nul

start webp-To-Png.bat
exit /b 0