#! /bin/bash
sudo pacman -Syu
gsettings set org.gnome.mutter experimental-features "['scale-monitor-framebuffer']" # включить дробное масштабирование

# remove useless pre-installed packages gnome shell
sudo pacman -R gnome-tour

# software
   Sudo pacman -S nano gparted neofetch dmidecode tilix xarchiver

# pipewire
   sudo pacman -S pipewire pipewire-pulse pipewire-jack lib32-pipewire gst-plugin-pipewire wireplumber
   systemctl --user enable --now pipewire pipewire.socket pipewire-pulse wireplumber

# Wi-Fi
   sudo pacman -S dhcpcd
   systemctl enable dhcpcd
   systemctl start dhcpcd

# bluetooth
   sudo pacman -S Blueman bluez bluez-utils bluez-deprecated-tools tlp
   sudo systemctl tlp
    # дальше нужно бы найти эти команды, а пока их нет, вручную в ui
   sudo pacman -S tlpui

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
   flatpak install flathub md.obsidian.Obsidian
   flatpak install flathub io.atom.Atom
   flatpak install flathub io.crow_translate.CrowTranslate
   flatpak install flathub com.librumreader.librum
   flatpak install flathub com.obsproject.Studio
   
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
  # пожалуй не сильно хочется качать из аура скриптом
  # sudo pacman -S steam-native-runtime
  # sudo pacman -S wine
  # протон ге
  # yay -S protontricks
  # yay -S winetricks
  # yay -S python-vdf
  sudo pacman -S yad # protontricks --gui

# обновить все пакеты, вывести и удалить осиротевшие пакеты
   pacman -Syu
   pacman -Qdt
   pacman -Rsn

# скрипт завершен
   echo COMPLETED
