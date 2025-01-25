@echo off
setlocal enabledelayedexpansion

call :banner

set /p target="Enter a target drive: "
set /p driveLabel="Enter a label for the target drive. (none for no label): "
set /p icon="Enter the path to the icon file. (in .ico format) (none for no icon): "
choice /c YN /n /m "Do you want to hide the files as System? (Y/N): "
echo.

%target%
echo [AutoRun] > autorun.inf

if "%driveLabel%" neq "none" (echo label=%driveLabel% >> autorun.inf)

if %icon% neq none (
    copy "%icon%" "%target%\icon.ico" > nul
    echo icon=icon.ico >> autorun.inf
)

if %errorlevel% == 1 (
    attrib +s +h "autorun.inf"
    if %icon% neq none (attrib +s +h "icon.ico")
)

echo Drive style created successfully!
pause > nul

color
exit /b 0
:banner
color 5
echo.
echo           ____       _           ____  _         _        _____    _ _ _             
echo          ^|  _ \ _ __(_)_   _____/ ___^|^| ^|_ _   _^| ^| ___  ^| ____^|__^| (_) ^|_ ___  _ __ 
echo          ^| ^| ^| ^| '__^| \ \ / / _ \___ \^| __^| ^| ^| ^| ^|/ _ \ ^|  _^| / _` ^| ^| __/ _ \^| '__^|
echo          ^| ^|_^| ^| ^|  ^| ^|\ V /  __/___) ^| ^|_^| ^|_^| ^| ^|  __/ ^| ^|__^| (_^| ^| ^| ^|^| (_) ^| ^|   
echo          ^|____/^|_^|  ^|_^| \_/ \___^|____/ \__^|\__, ^|_^|\___^| ^|_____\__,_^|_^|\__\___/^|_^|   
echo                                    ^|___/                                      
echo.
goto :eof             