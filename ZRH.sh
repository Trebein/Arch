#! /bin/bash
sudo pacman -Syu # обновлить все 
# включить дробное масштабирование
   gsettings set org.gnome.mutter experimental-features "['scale-monitor-framebuffer']" 
# fish

# добавить AUR
sudo pacman -S git base-devel --noconfirm
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si

cd
# добавить Flatpak и FlatHub
   sudo pacman -S flatpak
   flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
# настройка блютуз
   sudo pacman -S tlp # установить tlp
   sudo systemctl tlp # добавить tlp в автозагрузку
   # дальше нужно бы найти эти команды
# установить софт
   sudo pacman -S neofetch # консольная заставка
   sudo pacman -S dmidecode # модель ноутбука и его компонентов 
   sudo pacman -S steam-native-runtime # стим
   sudo pacman -S chromium # браузер
   sudo pacman -S telegram-desktop # телеграмм
   sudo pacman -S tilix # терминал
   sudo pacman -S
   sudo pacman -S



# обновить все пакеты, вывести и удалить осиротевшие
   pacman -Syu
   pacman -Qdt
   pacman -Rsn
# скрипт завершен
   echo COMPLETED
