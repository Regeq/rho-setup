@echo off
net session >nul 2>&1
if %errorLevel% neq 0 (
    powershell -WindowStyle Hidden -Command "Start-Process '%~f0' -Verb RunAs"
    exit /b
)

echo Removing hosts file entry...
set HOSTS_FILE=%SystemRoot%\System32\drivers\etc\hosts
findstr /V /C:"rho" "%HOSTS_FILE%" > "%HOSTS_FILE%.tmp"
move /Y "%HOSTS_FILE%.tmp" "%HOSTS_FILE%" >nul
ipconfig /flushdns >nul

echo Logging out of Tailscale...
"C:\Program Files\Tailscale\tailscale.exe" logout >nul 2>&1

echo Uninstalling Tailscale...
winget uninstall --id Tailscale.Tailscale -e --silent

powershell -sta -Command "Add-Type -AssemblyName System.Windows.Forms; [System.Windows.Forms.MessageBox]::Show('All removed:' + [Environment]::NewLine + '- rho shortcut deleted' + [Environment]::NewLine + '- Logged out of Tailscale' + [Environment]::NewLine + '- Tailscale uninstalled','Uninstall Complete',0,64)"
