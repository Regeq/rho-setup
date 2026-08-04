#!/bin/bash

echo "Removing hosts file entry..."
if grep -q "rho" /etc/hosts 2>/dev/null; then
    osascript -e 'do shell script "grep -v \"rho\" /etc/hosts > /tmp/hosts.tmp && mv /tmp/hosts.tmp /etc/hosts" with administrator privileges'
    dscacheutil -flushcache 2>/dev/null
    killall -HUP mDNSResponder 2>/dev/null
fi

echo "Logging out of Tailscale..."
tailscale logout 2>/dev/null

echo "Uninstalling Tailscale..."
if command -v brew &> /dev/null; then
    brew uninstall tailscale 2>/dev/null
fi

osascript -e 'display dialog "All removed:" & return & "- rho shortcut deleted" & return & "- Logged out of Tailscale" & return & "- Tailscale uninstalled" buttons {"OK"} default button 1 with title "Uninstall Complete"'

osascript -e 'tell application "Terminal" to close (every window whose name contains "uninstall-rho-full")' &
