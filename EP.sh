#! /bin/bash
sudo pacman -Syu # обновлить все 
gsettings set org.gnome.mutter experimental-features "['scale-monitor-framebuffer']" # включить дробное масштабирование

# Сменить шелл на ZSH
   sudo pacman -S zsh --noconfirm
   # chsh /zsh... # сделать ZSH оболочкой по умолчанию
   # о май зсш

# Добавить AUR
sudo pacman -S git base-devel --noconfirm
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si

cd
# Добавить Flatpak и FlatHub
   sudo pacman -S flatpak --noconfirm
   flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
# Установить Flatpak пакеты
   flatpak install flathub org.chromium.Chromium --noconfirm  # браузер
   flatpak install flathub com.discordapp.Discord --noconfirm  # discord
   flatpak install flathub de.shorsh.discord-screenaudio --noconfirm  # для discord
   flatpak install flathub org.telegram.desktop --noconfirm  # telegram
   
# Настройка блютуз
   sudo pacman -S tlp --noconfirm # установить tlp
   sudo systemctl tlp # добавить tlp в автозагрузку
   # дальше нужно бы найти эти команды, а пока их нет, вручную в ui
   sudo pacman -S tlpui --noconfirm
   
# Установить софт
   udo pacman -S nano --noconfirm
   sudo pacman -S gparted --noconfirm # диски
   sudo pacman -S neofetch --noconfirm # консольная заставка
   sudo pacman -S dmidecode --noconfirm # модель ноутбука и его компонентов 
   sudo pacman -S tilix --noconfirm # терминал

# Расширения
   flatpak install flathub com.mattjakeman.ExtensionManager
   # команда для установки расширений в терминале наверняка должна существовать

# Стим
  sudo pacman -S steam-native-runtime --noconfirm # сам стим
  sudo pacman -S wine 
  # протон ге
  yay -S protontricks
  yay -S winetricks
  yay -S python-vdf
   
# обновить все пакеты, вывести и удалить осиротевшие
   pacman -Syu
   pacman -Qdt
   pacman -Rsn
   
# скрипт завершен
   echo COMPLETED
