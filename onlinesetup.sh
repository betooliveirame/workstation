#!/bin/bash

set -x

echo ""
echo "Updating....."
echo "##########################################################################"
echo ""

sudo apt update

echo ""
echo "Instaling the basic packages"
echo "##########################################################################"
echo ""

sudo apt install python3 python3-pip nautilus-dropbox docker.io docker-compose git git-flow build-essential libssl-dev flatpak gnome-software-plugin-flatpak vim ubuntu-restricted-extras -y

echo ""
echo "Instaling the snap packages"
echo "##########################################################################"
echo ""

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

echo ""
echo "Instaling the flatpak packages"
echo "##########################################################################"
echo ""

flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo && 
sudo flatpak install flathub io.dbeaver.DBeaverCommunity -y &&
sudo flatpak install flathub com.github.alecaddd.sequeler -y

echo ""
echo "Instaling the downloadables packages"
echo "##########################################################################"
echo ""

cd ~/Downloads/ && wget -c https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb && sudo dpkg -i *.deb

echo ""
echo "System updating"
echo "##########################################################################"
echo ""

sudo apt update && sudo apt dist-upgrade -y && sudo apt autoclean -y && sudo apt autoremove -y

echo ""
echo ""
echo "##########################################################################"
echo "DONE!"
echo "##########################################################################"
