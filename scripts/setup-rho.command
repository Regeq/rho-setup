#!/bin/bash
IP_URL="https://raw.githubusercontent.com/yourname/rho-server-setup/main/ip.txt"
RHO_IP=$(curl -fsSL "$IP_URL" | tr -d '[:space:]')

if [ -z "$RHO_IP" ]; then
    osascript -e 'display dialog "Could not reach GitHub to get the server address. Check your internet connection." buttons {"OK"} with title "Server Setup"'
    exit 1
fi

# Remove any old entry first, then add the current one
osascript -e 'do shell script "grep -v \"rho\" /etc/hosts > /tmp/hosts.tmp; mv /tmp/hosts.tmp /etc/hosts; echo \"'"$RHO_IP"' rho\" >> /etc/hosts" with administrator privileges'

dscacheutil -flushcache 2>/dev/null
killall -HUP mDNSResponder 2>/dev/null

osascript -e 'display dialog "Address: rho" & return & "IP: '"$RHO_IP"'" buttons {"OK"} default button 1 with title "Server Setup"'

osascript -e 'tell application "Terminal" to close (every window whose name contains "setup-rho")' &
