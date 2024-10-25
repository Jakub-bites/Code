@echo off
title Program Upgrader
echo After upgrading, your computer may restart. still upgrade?
echo Press any key to continue
pause > nul
winget upgrade winget
winget upgrade --allow-reboot --accept-package-agreements --accept-source-agreements --all
echo The upgrade was successful
echo Press any key to continue