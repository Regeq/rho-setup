@echo off
:: Self-elevate if not already running as admin
net session >nul 2>&1
if %errorLevel% neq 0 (
    powershell -WindowStyle Hidden -Command "Start-Process '%~f0' -Verb RunAs"
    exit /b
)

set HOSTS_FILE=%SystemRoot%\System32\drivers\etc\hosts
set TEMP_FILE=%SystemRoot%\System32\drivers\etc\hosts.tmp

findstr /C:"rho" "%HOSTS_FILE%" >nul
if %errorlevel%==0 (
    findstr /V /C:"rho" "%HOSTS_FILE%" > "%TEMP_FILE%"
    move /Y "%TEMP_FILE%" "%HOSTS_FILE%" >nul
    ipconfig /flushdns >nul
    powershell -sta -Command "Add-Type -AssemblyName System.Windows.Forms; [System.Windows.Forms.MessageBox]::Show('Removed! The server shortcut has been uninstalled.','Server Uninstall',0,64)"
) else (
    powershell -sta -Command "Add-Type -AssemblyName System.Windows.Forms; [System.Windows.Forms.MessageBox]::Show('Nothing to remove - it was not set up on this computer.','Server Uninstall',0,64)"
)
