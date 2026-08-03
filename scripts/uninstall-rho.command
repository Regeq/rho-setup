#!/bin/bash
HOSTS_FILE="/etc/hosts"

if grep -q "rho" "$HOSTS_FILE" 2>/dev/null; then
    osascript -e 'do shell script "grep -v \"rho\" /etc/hosts > /tmp/hosts.tmp && mv /tmp/hosts.tmp /etc/hosts" with administrator privileges'
    dscacheutil -flushcache 2>/dev/null
    killall -HUP mDNSResponder 2>/dev/null
    osascript -e 'display dialog "Removed! The server shortcut has been uninstalled." buttons {"OK"} default button 1 with title "Server Uninstall"'
else
    osascript -e 'display dialog "Nothing to remove - it was not set up on this computer." buttons {"OK"} default button 1 with title "Server Uninstall"'
fi
osascript -e 'tell application "Terminal" to close (every window whose name contains "uninstall-rho")' &
