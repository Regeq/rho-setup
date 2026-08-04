@echo off
net session >nul 2>&1
if %errorLevel% neq 0 (
    powershell -WindowStyle Hidden -Command "Start-Process '%~f0' -Verb RunAs"
    exit /b
)

echo Installing Tailscale...
winget install --id Tailscale.Tailscale -e --silent

echo Fetching invite link...
for /f "delims=" %%i in ('powershell -Command "(Invoke-WebRequest -Uri 'https://gist.githubusercontent.com/Regeq/d35046f80c258fb361628bc9488ab71d/raw/gistfile1.txt' -UseBasicParsing).Content.Trim()"') do set INVITE_LINK=%%i

echo Opening Tailscale login...
"C:\Program Files\Tailscale\tailscale.exe" up

echo Opening invite link...
start "" "%INVITE_LINK%"

echo.
echo Once you've logged in AND accepted the invite, press any key to continue...
pause

echo Fetching server address...
for /f "delims=" %%i in ('powershell -Command "(Invoke-WebRequest -Uri 'https://raw.githubusercontent.com/Regeq/rho-setup/main/ip.txt' -UseBasicParsing).Content.Trim()"') do set RHO_IP=%%i

set HOSTS_FILE=%SystemRoot%\System32\drivers\etc\hosts
findstr /V /C:"rho" "%HOSTS_FILE%" > "%HOSTS_FILE%.tmp"
move /Y "%HOSTS_FILE%.tmp" "%HOSTS_FILE%" >nul
echo %RHO_IP% rho>>"%HOSTS_FILE%"
ipconfig /flushdns >nul

powershell -sta -Command "Add-Type -AssemblyName System.Windows.Forms; [System.Windows.Forms.MessageBox]::Show('Address: rho' + [Environment]::NewLine + 'IP: %RHO_IP%','Setup Complete',0,64)"
