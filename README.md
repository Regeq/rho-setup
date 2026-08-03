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

1. Make sure [Tailscale](https://tailscale.com/download) is installed and you've accepted the share invite.
2. Download [`setup-rho.bat`](scripts/setup-rho.bat) (right-click → *Save link as...*).
3. Double-click the downloaded file.
4. Click **"Yes"** when Windows asks for permission (this is normal — it needs to edit a system file).
   - If you see a blue "Windows protected your PC" screen, click **"More info"** → **"Run anyway"**.
5. A popup will confirm it worked.

You're done! In Minecraft, add the server as:
```
rho:25565
```

</details>

<details>
<summary><b>Mac — click to expand</b></summary>

1. Make sure [Tailscale](https://tailscale.com/download) is installed and you've accepted the share invite.
2. Download [`setup-rho.command`](scripts/setup-rho.command) (right-click → *Save Link As...*).
3. **First time only:** open Terminal and run this once so Mac allows it to run:
   ```
   chmod +x ~/Downloads/setup-rho.command
   ```
   *(If this step feels intimidating, just ask whoever shared the server with you to send you a version you can double-click directly — Mac requires this one-time permission step for downloaded scripts.)*
4. Double-click `setup-rho.command`.
5. Enter your Mac password when asked (this is normal, it's just confirming it's really you).
6. A popup will confirm it worked.

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

1. Download [`uninstall-rho.bat`](scripts/uninstall-rho.bat).
2. Double-click it, click **"Yes"** on the permission prompt.
3. A popup will confirm removal.

</details>

<details>
<summary><b>Mac — click to expand</b></summary>

1. Download [`uninstall-rho.command`](scripts/uninstall-rho.command).
2. Double-click it (run `chmod +x` on it first if it won't open, same as installation step 3).
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
