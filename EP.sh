#! /bin/bash
sudo pacman -Syu
gsettings set org.gnome.mutter experimental-features "['scale-monitor-framebuffer']" # включить дробное масштабирование

# remove useless pre-installed packages gnome shell
sudo pacman -R gnome-tour

# software
   Sudo pacman -S nano
   sudo pacman -S gparted
   sudo pacman -S neofetch
   sudo pacman -S dmidecode
   sudo pacman -S tilix

# pipewire
   sudo pacman -S pipewire pipewire-pulse pipewire-jack lib32-pipewire gst-plugin-pipewire wireplumber
   systemctl --user enable --now pipewire pipewire.socket pipewire-pulse wireplumber

# Wi-Fi
   sudo pacman -S dhcpcd
   systemctl enable dhcpcd
   systemctl start dhcpcd

# bluetooth
   sudo pacman -S Blueman
   sudo pacman -S bluez
   sudo pacman -S bluez-utils
   sudo pacman -S bluez-deprecated-tools
   sudo pacman -S tlp
   sudo systemctl tlp
   sudo pacman -S tlpui
   # дальше нужно бы найти эти команды, а пока их нет, вручную в ui

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
   sudo pacman -S git base-devel
   git clone https://aur.archlinux.org/yay.git
   cd yay
   makepkg -si
   cd

# Gnome Extensions
   flatpak install flathub com.mattjakeman.ExtensionManager
   # команда для установки расширений в терминале наверняка должна существовать

# Steam
  sudo pacman -S steam-native-runtime
  sudo pacman -S wine
  # протон ге
  yay -S protontricks
  yay -S winetricks
  yay -S python-vdf
  sudo pacman -S yad # protontricks --gui

# обновить все пакеты, вывести и удалить осиротевшие пакеты
   pacman -Syu
   pacman -Qdt
   pacman -Rsn

# скрипт завершен
   echo COMPLETED
