#!/bin/bash
set -e

echo "==> Updating system..."
sudo apt update && sudo apt upgrade -y

echo "==> Removing XFCE and Mint meta-packages..."
sudo apt purge -y mint-meta-xfce xfce4 xfce4-* lightdm lightdm-gtk-greeter
sudo apt autoremove -y --purge

echo "==> Installing GNOME desktop environment..."
sudo apt install -y gnome-session gnome-shell gnome-control-center gnome-terminal gdm3
sudo systemctl disable lightdm
sudo systemctl enable gdm3

echo "==> Installing core system tools..."
sudo apt install -y gnome-tweaks gnome-extensions-app curl git build-essential python3 python3-pip wget

echo "==> Installing Docker and VSCodium..."
sudo apt install -y docker.io docker-compose
sudo usermod -aG docker $USER
wget -qO - https://gitlab.com/ryanfortner/rpm-gpg-keys/-/raw/main/RPM-GPG-KEY-vscodium | gpg --dearmor | sudo tee /usr/share/keyrings/vscodium-archive-keyring.gpg >/dev/null
echo 'deb [signed-by=/usr/share/keyrings/vscodium-archive-keyring.gpg] https://packages.vscodium.com/debs vscodium main' | sudo tee /etc/apt/sources.list.d/vscodium.list
sudo apt update && sudo apt install -y codium

echo "==> Installing Flatpak + Flathub..."
sudo apt install -y flatpak gnome-software-plugin-flatpak
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

echo "==> Installing 1Password (native .deb)..."
curl -sS https://downloads.1password.com/linux/keys/1password.asc | gpg --dearmor | sudo tee /usr/share/keyrings/1password-archive-keyring.gpg >/dev/null
echo 'deb [signed-by=/usr/share/keyrings/1password-archive-keyring.gpg] https://downloads.1password.com/linux/debian/amd64 stable main' | sudo tee /etc/apt/sources.list.d/1password.list
sudo apt update && sudo apt install -y 1password

echo "==> Installing Brave browser..."
sudo curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg] https://brave-browser-apt-release.s3.brave.com/ stable main" | sudo tee /etc/apt/sources.list.d/brave-browser-release.list
sudo apt update && sudo apt install -y brave-browser

echo "==> Installing OpenRGB..."
sudo add-apt-repository ppa:thopiekar/openrgb -y
sudo apt update && sudo apt install -y openrgb

echo "==> Installing Thunar file manager..."
sudo apt install -y thunar

echo "==> Installing gaming tools..."
sudo apt install -y steam lutris gamemode
flatpak install -y flathub com.heroicgameslauncher.hgl
flatpak install -y flathub com.github.Matoking.Protontricks
flatpak install -y flathub net.davidotek.pupgui2  # ProtonUp-Qt

echo "==> Installing apps (Flatpak)..."
flatpak install -y flathub com.spotify.Client
flatpak install -y flathub com.parsecgaming.parsec
flatpak install -y flathub im.riot.Riot
flatpak install -y flathub org.coolercontrol.CoolerControl
flatpak install -y flathub org.gnome.Shotwell
flatpak install -y flathub com.github.tchx84.Flatseal

echo "==> Installing gnome-shell-extension-installer..."
sudo curl -o /usr/local/bin/gnome-shell-extension-installer https://raw.githubusercontent.com/brunelli/gnome-shell-extension-installer/master/gnome-shell-extension-installer
sudo chmod +x /usr/local/bin/gnome-shell-extension-installer

echo "==> Running GNOME extension installer..."
bash ./install-extensions.sh

echo "✅ Setup complete! Reboot recommended."
