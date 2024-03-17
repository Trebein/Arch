#! /bin/bash
sudo pacman -Syu # обновлить все 
gsettings set org.gnome.mutter experimental-features "['scale-monitor-framebuffer']" # включить дробное масштабирование

# ZSH

# добавить AUR
sudo pacman -S git base-devel --noconfirm
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si

cd
# добавить Flatpak и FlatHub
   sudo pacman -S flatpak --noconfirm
   flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
# Установить Flatpak пакеты
   flatpak install flathub org.chromium.Chromium --noconfirm  # браузер
   flatpak install flathub com.discordapp.Discord --noconfirm  # discord
   flatpak install flathub de.shorsh.discord-screenaudio --noconfirm  # для discord
   flatpak install flathub org.telegram.desktop --noconfirm  # telegram

   
# настройка блютуз
   sudo pacman -S tlp --noconfirm # установить tlp
   sudo systemctl tlp # добавить tlp в автозагрузку
   # дальше нужно бы найти эти команды, а пока их нет, вручную
   sudo pacman -S tlpui --noconfirm
   
# установить софт
   sudo pacman -S neofetch --noconfirm # консольная заставка
   sudo pacman -S dmidecode --noconfirm # модель ноутбука и его компонентов 
   sudo pacman -S tilix --noconfirm # терминал
   sudo pacman -S
   sudo pacman -S



# Стим
  sudo pacman -S steam-native-runtime --noconfirm # сам стим
  протон ге
  вайнтрикс
  протонтрикс
   
# обновить все пакеты, вывести и удалить осиротевшие
   pacman -Syu
   pacman -Qdt
   pacman -Rsn
# скрипт завершен
   echo COMPLETED
