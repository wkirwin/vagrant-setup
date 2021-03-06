#!/bin/bash

sudo apt-get update
sudo apt-get install git -y
sudo apt-get install tmux -y
sudo apt-get install htop -y
sudo apt-get install zsh -y
sudo apt-get install build-essential -y
sudo apt-get install curl -y

# for seamless mode:
#  1. set vb.gui = true in Vagrant file
#  2. uncomment the following
# sudo apt-get install lxde -y

# install zsh
git clone https://github.com/robbyrussell/oh-my-zsh.git /home/vagrant/.oh-my-zsh
cp /home/vagrant/.oh-my-zsh/templates/zshrc.zsh-template /home/vagrant/.zshrc
sudo chsh -s /bin/zsh vagrant

if [ -f /vagrant/resources/hosts ]; then
    sudo cp /vagrant/resources/hosts /etc
fi

if [ -d /vagrant/resources/.ssh ]; then
    su vagrant
    cp -r /vagrant/resources/.ssh /home/vagrant/.ssh
fi

# install httpie
sudo curl --silent https://bootstrap.pypa.io/get-pip.py | sudo python3
sudo pip install --upgrade httpie

