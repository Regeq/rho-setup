@echo off
net session >nul 2>&1
if %errorLevel% neq 0 (
    powershell -WindowStyle Hidden -Command "Start-Process '%~f0' -Verb RunAs"
    exit /b
)

for /f "delims=" %%i in ('powershell -Command "(Invoke-WebRequest -Uri 'https://raw.githubusercontent.com/yourname/rho-server-setup/main/ip.txt' -UseBasicParsing).Content.Trim()"') do set RHO_IP=%%i

set HOSTS_FILE=%SystemRoot%\System32\drivers\etc\hosts

:: Remove any old entry first, then add current one
findstr /V /C:"rho" "%HOSTS_FILE%" > "%HOSTS_FILE%.tmp"
move /Y "%HOSTS_FILE%.tmp" "%HOSTS_FILE%" >nul
echo %RHO_IP% rho>>"%HOSTS_FILE%"
ipconfig /flushdns >nul

powershell -sta -Command "Add-Type -AssemblyName System.Windows.Forms; [System.Windows.Forms.MessageBox]::Show('Address: rho' + [Environment]::NewLine + 'IP: %RHO_IP%','Server Setup',0,64)"