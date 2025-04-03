#!/bin/bash
set -euo pipefail

# ==================== ФУНКЦИИ ====================
status_msg() {
    echo -e "\n\033[1;34m==> \033[1;37m$1\033[0m"
}

log_error() {
    local timestamp=$(date +"%Y-%m-%d %T")
    local message="$1"
    local log_file="$HOME/EPSH.log"
    echo "[$timestamp] ОШИБКА: $message" >> "$log_file"
    echo -e "\033[1;31mОШИБКА: $message\033[0m" >&2
}

# ========== ГРУППИРОВКА ПАКЕТОВ В МАССИВЫ ==========
# Основные утилиты
PACKAGES_MAIN=(nano gparted neofetch dmidecode tilix xarchiver)
# Звуковая система
PACKAGES_PIPEWIRE=(pipewire pipewire-pulse pipewire-jack lib32-pipewire gst-plugin-pipewire wireplumber)
# Сетевые утилиты
PACKAGES_NETWORK=(dhcpcd)
# Bluetooth
PACKAGES_BLUETOOTH=(blueman bluez bluez-utils bluez-deprecated-tools tlp)
# Дополнительное ПО
PACKAGES_GAME=(steam-native-runtime lutris wine yad)

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
    org.keepassxc.KeePassXC
    com.nextcloud.desktopclient.nextcloud
    me.kozec.syncthingtk
)

# ============== ОСНОВНОЙ СКРИПТ ==============
# Обновление системы
status_msg "Обновление системы..."
sudo pacman -Syu --noconfirm || log_error "Не удалось обновить систему"

# Установка Snap
status_msg "Установка Snap..."
git clone https://aur.archlinux.org/snapd.git || log_error "Не удалось клонировать репозиторий snapd"
cd snapd && makepkg -si --noconfirm && cd ~ || log_error "Не удалось собрать и установить snapd"
sudo systemctl enable --now snapd.socket || log_error "Не удалось запустить snapd.socket"
sudo snap install tradingview || log_error "Не удалось установить tradingview через snap"

# Установка YAY
status_msg "Установка YAY..."
sudo pacman -S --noconfirm git base-devel || log_error "Не удалось установить зависимости для YAY"
git clone https://aur.archlinux.org/yay.git || log_error "Не удалось клонировать репозиторий YAY"
cd yay && makepkg -si --noconfirm && cd ~ || log_error "Не удалось собрать и установить YAY"

# Настройка звука (PipeWire)
status_msg "Настройка звуковой системы..."
sudo pacman -S --noconfirm "${PACKAGES_PIPEWIRE[@]}" || log_error "Не удалось установить звуковые пакеты"
systemctl --user enable --now pipewire pipewire.socket pipewire-pulse wireplumber || log_error "Не удалось запустить звуковые службы"

# Настройка сети
status_msg "Настройка сети..."
sudo pacman -S --noconfirm "${PACKAGES_NETWORK[@]}" || log_error "Не удалось установить сетевые пакеты"
sudo systemctl enable --now dhcpcd || log_error "Не удалось запустить сетевую службу dhcpcd"

# Настройка Bluetooth
status_msg "Установка пакетов для Bluetooth"
sudo pacman -S --noconfirm "${PACKAGES_BLUETOOTH[@]}" || log_error "Не удалось установить пакеты для Bluetooth"
sudo systemctl enable --now tlp || log_error "Не удалось запустить TLP"

# Настройка GNOME
status_msg "Настройка GNOME..."
gsettings set org.gnome.mutter experimental-features "['scale-monitor-framebuffer']" || log_error "Не удалось настроить GNOME"
# Удаление ненужных предустановленных пакетов GNOME
status_msg "Проверка и удаление ненужных пакетов GNOME..."
GNOME_PACKAGES_TO_REMOVE=(gnome-tour baobab epiphany evince totem)
INSTALLED_PKGS=()
for pkg in "${GNOME_PACKAGES_TO_REMOVE[@]}"; do
    if pacman -Q "$pkg" &>/dev/null; then
        INSTALLED_PKGS+=("$pkg")
    fi
done
if [ ${#INSTALLED_PKGS[@]} -gt 0 ]; then
    sudo pacman -R --noconfirm "${INSTALLED_PKGS[@]}" || \
        log_error "Не удалось удалить пакеты GNOME"
else
    echo "Ненужные пакеты GNOME не установлены, пропускаем удаление"
fi

# Установка основного ПО
status_msg "Установка основных утилит..."
sudo pacman -S --noconfirm "${PACKAGES_MAIN[@]}" || log_error "Не удалось установить основные утилиты"

# Установка дополнительного ПО
status_msg "Установка дополнительного ПО..."
sudo pacman -S --noconfirm "${PACKAGES_GAME[@]}" || log_error "Не удалось установить дополнительные пакеты"

# Установка Flatpak
status_msg "Настройка Flatpak..."
sudo pacman -S --noconfirm flatpak || log_error "Не удалось установить Flatpak"
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo || log_error "Не удалось добавить репозиторий Flatpak"

status_msg "Установка Flatpak-приложений..."
for app in "${FLATPAK_APPS[@]}"; do
    flatpak install -y flathub "$app" || log_error "Не удалось установить Flatpak-приложение $app"
done

# Финализация
status_msg "Завершающие действия..."
sudo pacman -Syu --noconfirm || log_error "Не удалось выполнить финальное обновление"
sudo pacman -Qdtq | sudo pacman -Rsn --noconfirm - || log_error "Не удалось удалить ненужные пакеты"

echo -e "\n\033[1;32mСистема готова к работе.\033[0m"
