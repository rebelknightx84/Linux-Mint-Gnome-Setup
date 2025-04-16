# Mint GNOME Setup

A script to convert Linux Mint XFCE into a fully customized GNOME desktop optimized for development and gaming.

## Features

- Removes XFCE and LightDM
- Installs GNOME + GDM + GNOME Tweaks & Extension Manager
- Installs:
  - Brave, 1Password (.deb), VSCodium, Docker
  - Steam, Lutris, Heroic, Protontricks, ProtonUp-Qt
  - Spotify, Element, Parsec, OpenRGB, CoolerControl
  - Thunar, Shotwell, Flatseal
- Installs GNOME Extensions via `gnome-shell-extension-installer`:
  - AppIndicator/KStatusNotifierItem
  - ArcMenu
  - Blur My Shell
  - Dash to Dock
  - Top Bar Organizer
  - User Themes

## Usage

```bash
chmod +x setup.sh install-extensions.sh
./setup.sh
