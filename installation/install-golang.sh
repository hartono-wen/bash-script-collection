#!/bin/bash

echo '===Start instaling Golang=============';
echo '===Set up the variables for later usage=============';

GO_PACKAGE_NAME="go1.11.5.linux-amd64.tar.gz";
BASH_RC_PATH="/etc/bash.bashrc";
BASH_RC_BACKUP_PATH="$BASH_RC_PATH.bak";
GO_DOWNLOAD_URL="https://dl.google.com/go/$GO_PACKAGE_NAME"

echo $GO_PACKAGE_NAME;
echo $BASH_RC_PATH;
echo $BASH_RC_BACKUP_PATH;

echo '===Install the needed application=============';
sudo apt-get update;
sudo apt-get install -y wget tar;

echo '===Download Golang Package from official Google Golang website=============';
sudo wget $GO_DOWNLOAD_URL;

echo '===Extract the Golang package and put it into the system application location=============';
sudo tar -C /usr/local -xzf $GO_PACKAGE_NAME;

echo '===Backup the original environment variable file=============';
sudo cp $BASH_RC_PATH $BASH_RC_BACKUP_PATH;

echo '===Set the needed environment variables=============';
echo 'export GOROOT=/usr/local/go' >> $BASH_RC_PATH;
echo 'export GOPATH=$HOME/go' >> $BASH_RC_PATH;
echo 'export PATH=$PATH:$GOPATH/bin:$GOROOT/bin' >> $BASH_RC_PATH;

echo '===Finish instaling Golang=============';
echo '===Please dont forget to reboot your computer so that the gopath is recognized by the computer=============';
