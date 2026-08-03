# Minecraft Server Access Setup

This repo has everything you need to connect to the Minecraft server, plus one-click scripts so you don't have to type anything into a terminal.

## Quick Info

- **Server address:** `rho:25565`
- **Requires:** [Tailscale](https://tailscale.com/download) installed, and you must have accepted the share invite sent to you.

Once Tailscale is installed and the invite is accepted, run the setup script below **once** — after that, you can just type `rho` as the server address in Minecraft, forever.

---

## Installation

<details>
<summary><b>Windows — click to expand</b></summary>

[![Download for Windows](https://img.shields.io/badge/Windows-Download-blue?style=for-the-badge&logo=windows)](https://raw.githubusercontent.com/Regeq/rho-setup/main/scripts/setup-rho.bat)


1. Make sure Tailscale is installed and you've accepted the share invite.
2. Download setup-rho.bat (right-click → Save link as...).
3. Double-click the downloaded file.
4. Click "Yes" when Windows asks for permission (this is normal — it needs to edit a system file).
5. If you see a blue "Windows protected your PC" screen, click "More info" → "Run anyway".
6. A popup will confirm it worked and show you the address it set up.

In Minecraft, add the server as:
```
rho
```
or
```
rho:25565
```

</details>

<details>
<summary><b>Mac — click to expand</b></summary>

[![Download for Mac](https://img.shields.io/badge/Apple-Download-blue?style=flat&logo=apple
)](https://raw.githubusercontent.com/yourname/your-repo-name/main/scripts/setup-rho.command)

Make sure Tailscale is installed and you've accepted the share invite.
Download setup-rho.command (right-click → Save Link As...).
First time only: open Terminal and run this once so Mac allows it to run:
```
   chmod +x ~/Downloads/setup-rho.command
```
**(If you don't know what you are doing (or don't trust yourself) then ask whoever shared the server with you to help you or don't do it)**
4. Double-click setup-rho.command. 
5. Enter your Mac password when asked (this is normal, it's just confirming it's really you). 
6. A popup will confirm it worked and show you the address it set up.

You're done! In Minecraft, add the server as:
```
   rho
```
or
```
   rho:25565
```
</details>

---

## Uninstallation

If you ever want to remove the shortcut (e.g. you're done playing on this server):

<details>
<summary><b>Windows — click to expand</b></summary>

[![Download for Windows](https://img.shields.io/badge/Windows-Download-blue?style=for-the-badge&logo=windows)](https://raw.githubusercontent.com/Regeq/rho-setup/main/scripts/uninstall-rho.bat)


1. Download uninstall-rho.bat.
2. Double-click it, click "Yes" on the permission prompt.
3. A popup will confirm removal.

</details>

<details>
<summary><b>Mac — click to expand</b></summary>

[![Download for Mac](https://img.shields.io/badge/Apple-Download-blue?style=flat&logo=apple
)](https://raw.githubusercontent.com/Regeq/rho-setup/main/scripts/uninstall-rho.command)

1. Download uninstall-rho.command.
2. Double-click it (run chmod +x on it first if it won't open, same as installation step 3).
3. Enter your Mac password when asked.
4. A popup will confirm removal.

</details>

---

## What do these scripts actually do?

They add one line to a sys file on your computer that makes `rho` resolvable without a DNS. It only works for reaching this one server, and only while you're connected to Tailscale — it doesn't do anything else. The uninstall script just removes that one line.

## Troubleshooting

- **"rho" doesn't connect:** make sure Tailscale is running (check for the icon in your system tray / menu bar) and that you're actually online.
- **Windows SmartScreen warning:** click "More info" → "Run anyway" — this happens because the script isn't a paid/signed publisher, not because anything is wrong.
- **Doesn't work?** DM `regeq` on discord or create an issue on github
