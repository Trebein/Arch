#! /bin/bash
sudo pacman -Syu
gsettings set org.gnome.mutter experimental-features "['scale-monitor-framebuffer']" # включить дробное масштабирование

# Софт
   Sudo pacman -S nano --noconfirm
   sudo pacman -S gparted --noconfirm # диски
   sudo pacman -S neofetch --noconfirm # консольная заставка
   sudo pacman -S dmidecode --noconfirm # модель ноутбука и его компонентов
   sudo pacman -S tilix --noconfirm # терминал

# Звук
   sudo pacman -S pipewire pipewire-pulse pipewire-jack lib32-pipewire gst-plugin-pipewire wireplumber
   systemctl --user enable --now pipewire pipewire.socket pipewire-pulse wireplumber

# Сеть
   sudo pacman -S dhcpcd
   systemctl enable dhcpcd
   systemctl start dhcpcd

# Блютуз
   sudo pacman -S bluez --noconfirm
   sudo pacman -S bluez-utils --noconfirm
   sudo pacman -S bluez-deprecated-tools --noconfirm
   sudo pacman -S tlp --noconfirm # установить tlp
   sudo systemctl tlp # добавить tlp в автозагрузку
   sudo pacman -S tlpui --noconfirm
   # дальше нужно бы найти эти команды, а пока их нет, вручную в ui
   sudo pacman -S Blueman --noconfirm

# ZSH
   # sudo pacman -S zsh --noconfirm
   # ... # сделать ZSH оболочкой по умолчанию
   # ... о май зсш

# FlatHub
   sudo pacman -S flatpak
   flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
   flatpak install flathub org.chromium.Chromium
   flatpak install flathub com.discordapp.Discord
   flatpak install flathub de.shorsh.discord-screenaudio
   flatpak install flathub org.telegram.desktop
   flatpak install flathub io.atom.Atom
   flatpak install flathub io.crow_translate.CrowTranslate
   flatpak install flathub com.librumreader.librum
   
# Snap
   git clone https://aur.archlinux.org/snapd.git
   cd snapd
   makepkg -si
   cd
   sudo systemctl enable --now snapd.socket
   sudo snap install tradingview #TradingView

 # AUR
   sudo pacman -S git base-devel --noconfirm
   git clone https://aur.archlinux.org/yay.git
   cd yay
   makepkg -si
   cd

# Gnome Extensions
   flatpak install flathub com.mattjakeman.ExtensionManager
   # команда для установки расширений в терминале наверняка должна существовать

# Steam
  sudo pacman -S steam-native-runtime --noconfirm # сам стим
  sudo pacman -S wine
  # протон ге
  yay -S protontricks
  yay -S winetricks
  yay -S python-vdf
  sudo pacman -S yad # protontricks --gui

# обновить все пакеты, вывести и удалить осиротевшие
   pacman -Syu
   pacman -Qdt
   pacman -Rsn

# скрипт завершен
   echo COMPLETED
