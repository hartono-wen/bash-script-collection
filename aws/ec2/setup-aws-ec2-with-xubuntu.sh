#!/bin/bash

# This is a script to install Xubuntu desktop environment (based on xfce4) to AWS EC2 instance.
# I have tested it in Ubuntu Server running on Virtual Box, and it works as well.
# Unfortunately, I haven't tested it in any other Ubuntu VPS providers (such as Digital Ocean, Vultr, Linode, etc).
# So, I cannot guarantee whether this will be working as expected in those providers.
# Please use this at your own risk.

SERVER_PASSWORD="mysupersecurepassword";

sudo apt-get update -y;
sudo apt-get upgrade -y;
sudo apt-get full-upgrade -y;
sudo apt-get dist-upgrade -y;
sudo apt-get autoremove -y;
sudo apt-get autoclean -y;

sudo sed -i 's\PasswordAuthentication no\PasswordAuthentication yes\g' /etc/ssh/sshd_config;

sudo /etc/init.d/ssh restart;

sudo echo -e "$SERVER_PASSWORD\n$SERVER_PASSWORD" | passwd ubuntu

sudo apt-get install xrdp nano xubuntu-desktop -y;

echo xfce4-session >~/.xsession;

sudo cp /home/ubuntu/.xsession /etc/skel;

sudo sed -i 's\port=-1\port=ask-1\g' /etc/xrdp/xrdp.ini;

sudo service xrdp restart;
