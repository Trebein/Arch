#!/bin/bash
set -eo pipefail

# ==================== ФУНКЦИИ ====================
status_msg() {
    echo -e "\n\033[1;34m==> \033[1;37m$1\033[0m"
}



# ========== ГРУППИРОВКА ПАКЕТОВ В МАССИВЫ ==========
# Основные утилиты
PACKAGES_MAIN=(nano gparted neofetch dmidecode tilix xarchiver)
# Звуковая система
PACKAGES_PIPEWIRE=(pipewire pipewire-pulse pipewire-jack lib32-pipewire gst-plugin-pipewire wireplumber)
# Сетевые утилиты
PACKAGES_NETWORK=(dhcpcd)
# Bluetooth и управление питанием
PACKAGES_BLUETOOTH=(blueman bluez bluez-utils bluez-deprecated-tools tlp)
# Дополнительное ПО
PACKAGES_GAME=(steam-native-runtime wine protonup-qt yad)

# Flatpak приложения
FLATPAK_APPS=(
    org.chromium.Chromium
    com.discordapp.Discord
    de.shorsh.discord-screenaudio
    org.telegram.desktop
    md.obsidian.Obsidian
    io.crow_translate.CrowTranslate
    com.librumreader.librum
    com.obsproject.Studio
    net.lutris.Lutris
    org.keepassxc.KeePassXC
    com.nextcloud.desktopclient.nextcloud
    me.kozec.syncthingtk
)

# ============== ОСНОВНОЙ СКРИПТ ==============
# Обновление системы
status_msg "Обновление системы..."
sudo pacman -Syu --noconfirm

# Настройка GNOME
status_msg "Настройка GNOME..."
gsettings set org.gnome.mutter experimental-features "['scale-monitor-framebuffer']"
sudo pacman -R --noconfirm gnome-tour baobab epiphany evince totem

# Установка основного ПО
status_msg "Установка основных утилит..."
sudo pacman -S --noconfirm "${PACKAGES_MAIN[@]}"

# Настройка звука (PipeWire)
status_msg "Настройка звуковой системы..."
sudo pacman -S --noconfirm "${PACKAGES_PIPEWIRE[@]}"
systemctl --user enable --now pipewire{,-pulse}.socket wireplumber

# Настройка сети
status_msg "Настройка сети..."
sudo pacman -S --noconfirm "${PACKAGES_NETWORK[@]}"
sudo systemctl enable --now dhcpcd

# Установка Bluetooth и TLP
status_msg "Установка Bluetooth и TLP..."
sudo pacman -S --noconfirm "${PACKAGES_BLUETOOTH[@]}"
sudo systemctl enable --now tlp

# Установка дополнительного ПО
status_msg "Установка дополнительного ПО..."
sudo pacman -S --noconfirm "${PACKAGES_GAME[@]}"

# Установка Flatpak
status_msg "Настройка Flatpak..."
sudo pacman -S --noconfirm flatpak
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

status_msg "Установка Flatpak-приложений..."
for app in "${FLATPAK_APPS[@]}"; do
    flatpak install -y flathub "$app" || echo "Не удалось установить $app"
done

# Установка Snap
status_msg "Установка Snap..."
git clone https://aur.archlinux.org/snapd.git
cd snapd && makepkg -si --noconfirm && cd
sudo systemctl enable --now snapd.socket
sudo snap install tradingview --noconfirm

# Установка YAY
status_msg "Установка YAY..."
sudo pacman -S --noconfirm git base-devel
git clone https://aur.archlinux.org/yay.git
cd yay && makepkg -si --noconfirm && cd

# Финализация
status_msg "Завершающие действия..."
sudo pacman -Syu --noconfirm
sudo pacman -Qdtq | sudo pacman -Rsn --noconfirm -

echo -e "\n\033[1;32mСистема готова к работе!\033[0m"
