#!/bin/bash

set -x

sudo dpkg --configure -a  &&
sudo rm /var/lib/dpkg/lock-frontend; sudo rm /var/cache/apt/archives/lock;  &&

sudo sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list'  &&
sudo wget -q -O - https://dl.google.com/linux/linux_signing_key.pub | sudo apt-key add -  &&
sudo apt update &&

echo ttf-mscorefonts-installer msttcorefonts/accepted-mscorefonts-eula select true | sudo debconf-set-selections  &&
echo ttf-mscorefonts-installer msttcorefonts/present-mscorefonts-eula note | sudo debconf-set-selections  &&
sudo env ACCEPT_EULA=Y apt install python3 python3-pip nautilus-dropbox docker.io docker-compose git git-flow build-essential libssl-dev flatpak gnome-software-plugin-flatpak vim virtualbox ubuntu-restricted-extras google-chrome-stable -y  &&

sudo snap install slack --classic &&  
sudo snap install skype --classic &&  
sudo snap install sublime-text --classic &&  
sudo snap install sublime-merge --classic &&
sudo snap install insomnia && 
sudo snap install postman &&
sudo snap install redis-desktop-manager && 
sudo snap install spotify &&
sudo snap install odio &&
sudo snap install whatsdesk &&
sudo snap install wps-office-multilang && 
sudo snap install mailspring &&
sudo snap install mysql-workbench-community --beta &&

sudo flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo &&

sudo groupadd docker  &&
sudo gpasswd -a $USER docker  &&
sudo service docker.io restart  &&

sudo apt update && sudo apt dist-upgrade -y && sudo apt autoclean -y && sudo apt autoremove -y  &&

echo "DONE!"
