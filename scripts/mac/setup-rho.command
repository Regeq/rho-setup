#!/bin/bash

echo "Installing Tailscale..."
if ! command -v tailscale &> /dev/null; then
    brew install tailscale 2>/dev/null || osascript -e 'display dialog "Tailscale not found and Homebrew install failed. Please install Tailscale manually from tailscale.com/download, then run this script again." buttons {"OK"} with title "Setup"'
fi

echo "Fetching invite link..."
INVITE_LINK=$(curl -fsSL "https://gist.githubusercontent.com/Regeq/d35046f80c258fb361628bc9488ab71d/raw/gistfile1.txt")

if [ -z "$INVITE_LINK" ]; then
    osascript -e 'display dialog "Could not fetch the invite link. Check your internet connection." buttons {"OK"} with title "Setup"'
    exit 1
fi

echo "Opening Tailscale login..."
sudo tailscale up &

echo "Opening invite link..."
open "$INVITE_LINK"

osascript -e 'display dialog "Please log in to Tailscale AND accept the invite link that just opened, then click OK to continue." buttons {"OK"} default button 1 with title "Setup"'

echo "Fetching server address..."
RHO_IP=$(curl -fsSL "https://raw.githubusercontent.com/Regeq/rho-setup/main/ip.txt" | tr -d '[:space:]')

if [ -z "$RHO_IP" ]; then
    osascript -e 'display dialog "Could not fetch the server address. Check your internet connection." buttons {"OK"} with title "Setup"'
    exit 1
fi

osascript -e 'do shell script "grep -v \"rho\" /etc/hosts > /tmp/hosts.tmp; mv /tmp/hosts.tmp /etc/hosts; echo \"'"$RHO_IP"' rho\" >> /etc/hosts" with administrator privileges'

dscacheutil -flushcache 2>/dev/null
killall -HUP mDNSResponder 2>/dev/null

osascript -e 'display dialog "Address: rho" & return & "IP: '"$RHO_IP"'" buttons {"OK"} default button 1 with title "Setup Complete"'

osascript -e 'tell application "Terminal" to close (every window whose name contains "setup-rho")' &
