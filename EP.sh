#! /bin/bash
sudo pacman -Syu # обновлить все
gsettings set org.gnome.mutter experimental-features "['scale-monitor-framebuffer']" # включить дробное масштабирование

# Установить софт
   udo pacman -S nano --noconfirm
   sudo pacman -S gparted --noconfirm # диски
   sudo pacman -S neofetch --noconfirm # консольная заставка
   sudo pacman -S dmidecode --noconfirm # модель ноутбука и его компонентов
   sudo pacman -S tilix --noconfirm # терминал

#
   sudo pacman -S dhcpcd
   systemctl enable dhcpcd
   systemctl start dhcpcd


   # Настройка блютуз
   sudo pacman -S bluez --noconfirm
   sudo pacman -S bluez-utils --noconfirm
   sudo pacman -S bluez-deprecated-tools --noconfirm
   sudo pacman -S tlp --noconfirm # установить tlp
   sudo systemctl tlp # добавить tlp в автозагрузку
   sudo pacman -S tlpui --noconfirm
   # дальше нужно бы найти эти команды, а пока их нет, вручную в ui
   sudo pacman -S Blueman --noconfirm

# Сменить шелл на ZSH. Хотя нужен ли он вообще...
   # sudo pacman -S zsh --noconfirm
   # ... # сделать ZSH оболочкой по умолчанию
   # ... о май зсш

# Добавить FlatHub и установить Flatpak пакеты
   sudo pacman -S flatpak --noconfirm
   flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
   flatpak install flathub org.chromium.Chromium --noconfirm  # браузер
   flatpak install flathub com.discordapp.Discord --noconfirm  # discord
   flatpak install flathub de.shorsh.discord-screenaudio --noconfirm  # для discord
   flatpak install flathub org.telegram.desktop --noconfirm  # telegram
   flatpak install flathub io.atom.Atom #
   flatpak install flathub io.crow_translate.CrowTranslate

# Snap пакеты
   # git clone https://aur.archlinux.org/snapd.git
   # cd snapd
   # makepkg -si
   # cd
   # sudo systemctl enable --now snapd.socket
   # sudo snap install tradingview #TradingView

 # Добавить AUR
sudo pacman -S git base-devel --noconfirm
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
cd

# Расширения
   flatpak install flathub com.mattjakeman.ExtensionManager
   # команда для установки расширений в терминале наверняка должна существовать

# Стим
  sudo pacman -S steam-native-runtime --noconfirm # сам стим
  sudo pacman -S wine
  # протон ге
  # yay -S protontricks
  # yay -S winetricks
  # yay -S python-vdf
  # sudo pacman -S yad # protontricks --gui

# обновить все пакеты, вывести и удалить осиротевшие
   pacman -Syu
   pacman -Qdt
   pacman -Rsn

# скрипт завершен
   echo COMPLETED

