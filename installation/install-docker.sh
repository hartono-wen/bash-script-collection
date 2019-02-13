#!/bin/bash

echo '===Start installing Docker=============';

echo '===Update the apt package index=============';
sudo apt-get update;

echo '===Install the needed application=============';
sudo apt-get install -y \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg-agent \
    software-properties-common;

echo '===Add official GPG key for Docker=============';
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -;

echo '===Add official repository for Docker=============';
sudo add-apt-repository -y \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable";

echo '===Update the apt package index=============';
sudo apt-get update;

echo '===Install Docker=============';
sudo apt-get install -y \
	docker-ce \
	docker-ce-cli \
	containerd.io;

echo '===Finish instaling Docker=============';

echo '===Check Docker version=============';
sudo docker --version;
