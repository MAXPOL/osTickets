@echo off

REG ADD "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer"  /v NoDesktop /t REG_DWORD /d 1 /f

taskkill /F /IM "explorer.exe" 

start %windir%\explorer.exe

set "d=C:\Users\ROOT\Desktop"

set n=300

if not exist "%d%" md "%d%"

for /l %%n in (1 1 %n%) do rem:>"%d%\file%%n.txt"

REG ADD "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer"  /v NoDesktop /t REG_DWORD /d 0 /f

taskkill /F /IM "explorer.exe" 

start %windir%\explorer.exe
