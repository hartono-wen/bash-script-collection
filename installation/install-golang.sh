#!/bin/bash

INSTALLED_MODULE_NAME="Go";

echo '===Start installing '$INSTALLED_MODULE_NAME'=============';

echo '===Set up the variables for later usage=============';
COMMON_USER_APPLICATION_LOCATION="/usr/local/"
GO_FOLDER_NAME="go"
GO_EXECUTABLE_LOCATION="$COMMON_USER_APPLICATION_LOCATION$GO_FOLDER_NAME/bin"
GO_PACKAGE_NAME="go1.11.5.linux-amd64.tar.gz";
GO_PACKAGE_DOWNLOAD_URL="https://dl.google.com/go/$GO_PACKAGE_NAME";
BASH_RC_PATH="/etc/bash.bashrc";
BASH_RC_BACKUP_PATH="$BASH_RC_PATH.bak";

echo '===Write the values of the variables=============';
echo 'COMMON_USER_APPLICATION_LOCATION='$COMMON_USER_APPLICATION_LOCATION''
echo 'GO_FOLDER_NAME='$GO_FOLDER_NAME''
echo 'GO_EXECUTABLE_LOCATION='$GO_EXECUTABLE_LOCATION''
echo 'GO_PACKAGE_NAME='$GO_PACKAGE_NAME'';
echo 'GO_PACKAGE_DOWNLOAD_URL='$GO_PACKAGE_DOWNLOAD_URL'';
echo 'BASH_RC_PATH='$BASH_RC_PATH'';
echo 'BASH_RC_BACKUP_PATH='$BASH_RC_BACKUP_PATH'';

echo '===Update the apt package index=============';
sudo apt-get update;

echo '===Install the needed application=============';
sudo apt-get install -y wget tar;

echo '===Download '$INSTALLED_MODULE_NAME$'\'s package installer=============';
sudo wget -nc $GO_PACKAGE_DOWNLOAD_URL;

echo '===Extract '$INSTALLED_MODULE_NAME' package and put it into the system application location=============';
sudo tar -C /usr/local -xzf $GO_PACKAGE_NAME;

echo '===Backup the original environment variable file=============';
if [ -e $BASH_RC_BACKUP_PATH ]
then
    echo '===Backup file '$BASH_RC_BACKUP_PATH' already exists============='
else
    echo '===Backup file '$BASH_RC_BACKUP_PATH' does not exist yet============='
    sudo cp $BASH_RC_PATH $BASH_RC_BACKUP_PATH;
    echo '===Backup file '$BASH_RC_BACKUP_PATH' is created now============='
fi

echo '===Set the needed environment variables=============';
echo 'export GOROOT=/usr/local/go' >> $BASH_RC_PATH;
echo 'export GOPATH=$HOME/go' >> $BASH_RC_PATH;
echo 'export PATH=$PATH:$GOPATH/bin:$GOROOT/bin' >> $BASH_RC_PATH;

echo '===Finish instaling '$INSTALLED_MODULE_NAME'=============';

echo '===Check '$INSTALLED_MODULE_NAME' version=============';
eval '$GO_EXECUTABLE_LOCATION/go version'

echo '===Please dont forget to reboot your computer so that Go-related path is recognized by the computer=============';
