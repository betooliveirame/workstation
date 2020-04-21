#!/bin/bash

set -x

# Basic configuration

sudo dpkg --configure -a
sudo rm /var/lib/dpkg/lock-frontend; sudo rm /var/cache/apt/archives/lock;
sudo apt update

# install basic packges

sudo env ACCEPT_EULA=Y apt install python3 python3-pip nautilus-dropbox docker.io docker-compose git git-flow build-essential libssl-dev flatpak gnome-software-plugin-flatpak vim virtualbox ubuntu-restricted-extras -y

# install applications

sudo snap install slack --classic &&  
sudo snap install skype --classic &&  
sudo snap install sublime-text --classic &&  
sudo snap install sublime-merge --classic &&
sudo snap install --edge node --classic && 
sudo snap install insomnia && 
sudo snap install postman &&
sudo snap install redis-desktop-manager && 
sudo snap install spotify &&
sudo snap install odio &&
sudo snap install whatsdesk &&
sudo snap install wps-office-multilang && 
sudo snap install mailspring

# install packes not found on snap

flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo && 
sudo flatpak install flathub io.dbeaver.DBeaverCommunity -y &&
sudo flatpak install flathub com.github.alecaddd.sequeler -y

# install downloadable applications

cd ~/Downloads/ && wget -c https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb && sudo dpkg -i *.deb

# configure docker without sudo

sudo groupadd docker
sudo gpasswd -a $USER docker
sudo service docker.io restart

# update the system

sudo apt update && sudo apt dist-upgrade -y && sudo apt autoclean -y && sudo apt autoremove -y

echo "DONE!"
