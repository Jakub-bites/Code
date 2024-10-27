@echo off
chcp 65001 > nul
title .webp to .png converter

rem Zadávanie údajov
set /p start="Zadajte umiestnenie .webp súboru: "
set /p ciel="Zadajte umiestnenie do ktoreho sa .png subor uloží: "
set /p nazov="Zadajte názov výstupného súboru: "

rem Prevádzanie
ffmpeg -i "%start%" "%ciel%\%nazov%.png"
cls
echo Úspešne konvertované
exit /b 0