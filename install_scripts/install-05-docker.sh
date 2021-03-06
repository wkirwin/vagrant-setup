#!/bin/bash

sudo apt-get update
sudo apt-get install apt-transport-https ca-certificates
sudo apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D

sudo cp -f /vagrant/resources/docker.list /etc/apt/sources.list.d/docker.list

sudo apt-get update
sudo apt-get install linux-image-extra-$(uname -r)
sudo apt-get install apparmor

sudo apt-get install docker-engine=1.8.3-0~trusty

sudo chmod o=rwx /var/run/docker.sock
sudo service docker stop
sudo service docker start

sudo usermod -aG docker vagrant
