#!/bin/bash

INSTALLED_MODULE_NAME="Julia";

echo '===Start installing '$INSTALLED_MODULE_NAME'=============';

echo '===Set up the variables for later usage=============';
COMMON_USER_APPLICATION_LOCATION="/usr/local/";
JULIA_FOLDER_NAME="julia-1.0.4";
JULIA_EXECUTABLE_LOCATION="$COMMON_USER_APPLICATION_LOCATION$JULIA_FOLDER_NAME/bin";
JULIA_PACKAGE_NAME="$JULIA_FOLDER_NAME-linux-x86_64.tar.gz";
JULIA_PACKAGE_DOWNLOAD_URL="https://julialang-s3.julialang.org/bin/linux/x64/1.0/$JULIA_PACKAGE_NAME";
BASH_RC_PATH="/etc/bash.bashrc";
BASH_RC_BACKUP_PATH="$BASH_RC_PATH.bak";

echo '===Write the values of the variables=============';
echo 'COMMON_USER_APPLICATION_LOCATION='$COMMON_USER_APPLICATION_LOCATION'';
echo 'JULIA_FOLDER_NAME='$JULIA_FOLDER_NAME'';
echo 'JULIA_EXECUTABLE_LOCATION='$JULIA_EXECUTABLE_LOCATION'';
echo 'JULIA_PACKAGE_NAME='$JULIA_PACKAGE_NAME'';
echo 'JULIA_PACKAGE_DOWNLOAD_URL='$JULIA_PACKAGE_DOWNLOAD_URL'';
echo 'BASH_RC_PATH='$BASH_RC_PATH'';
echo 'BASH_RC_BACKUP_PATH='$BASH_RC_BACKUP_PATH'';

echo '===Update the apt package index=============';
sudo apt-get update;

echo '===Install the needed application=============';
sudo apt-get install -y wget tar;

echo '===Download '$INSTALLED_MODULE_NAME$'\'s package installer=============';
sudo wget -nc $JULIA_PACKAGE_DOWNLOAD_URL;

echo '===Extract '$INSTALLED_MODULE_NAME' package and put it into the system application location=============';
sudo tar -C /usr/local -xzf $JULIA_PACKAGE_NAME;

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
echo 'export PATH=$PATH:'$JULIA_EXECUTABLE_LOCATION'' >> $BASH_RC_PATH;

echo '===Finish instaling '$INSTALLED_MODULE_NAME'=============';

echo '===Check '$INSTALLED_MODULE_NAME' version=============';
eval '$JULIA_EXECUTABLE_LOCATION/julia --version'

echo '===Please dont forget to reboot your computer so that Julia is recognized by the computer=============';
