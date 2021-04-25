#!/bin/bash

set -x

# before start
sudo dpkg --configure -a
sudo rm /var/lib/dpkg/lock-frontend; sudo rm /var/cache/apt/archives/lock;

# add chrome repository
sudo sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list'  &&
sudo wget -q -O - https://dl.google.com/linux/linux_signing_key.pub | sudo apt-key add -  &&

sudo apt update &&

# auto accept eula
echo ttf-mscorefonts-installer msttcorefonts/accepted-mscorefonts-eula select true | sudo debconf-set-selections  &&
echo ttf-mscorefonts-installer msttcorefonts/present-mscorefonts-eula note | sudo debconf-set-selections  &&

# basic packes
sudo env ACCEPT_EULA=Y apt install curl \
wget \
gnupg2 \
ca-certificates \
lsb-release \
apt-transport-https \
python3 \
python3-pip \
nautilus-dropbox \
docker.io \
docker-compose \
git git-flow \
build-essential \
libssl-dev \
flatpak \
gnome-software-plugin-flatpak \
vim \
virtualbox \
ubuntu-restricted-extras \
google-chrome-stable \
awscli -y  &&

sudo gpasswd -a $USER docker  &&

# php 7.3 for magento 2
sudo apt install -y zip unzip php7.4-cli php7.4-common php7.4-opcache php7.4-xml php7.4-gd php7.4-dev php7.4-mysql php7.4-intl php7.4-mbstring php7.4-bcmath php7.4-json php7.4-soap php7.4-zip php7.4-curl &&

# php dev tools
sudo wget https://getcomposer.org/composer-stable.phar -O /usr/local/bin/composer &&
sudo chmod a+x /usr/local/bin/composer  &&
sudo wget https://files.magerun.net/n98-magerun2.phar -O /usr/local/bin/magerun  &&
sudo chmod a+x /usr/local/bin/magerun  &&

# snap apps
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

# add flathub
sudo flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo &&

# update
sudo apt update && sudo apt dist-upgrade -y && sudo apt autoclean -y && sudo apt autoremove -y  &&

echo "DONE!"

