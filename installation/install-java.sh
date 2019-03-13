#!/bin/bash

INSTALLED_MODULE_NAME="Java";

echo '===Start installing '$INSTALLED_MODULE_NAME'=============';

echo '===Set up the variables for later usage=============';
BASH_RC_PATH="/etc/bash.bashrc";
BASH_RC_BACKUP_PATH="$BASH_RC_PATH.bak";

echo '===Update the apt package index=============';
sudo apt-get update;

echo '===Install '$INSTALLED_MODULE_NAME'=============';
sudo apt-get install -y curl openjdk-8-jdk;

echo '===Backup the original environment variable file=============';
if [ -e $BASH_RC_BACKUP_PATH ]
then
	echo '===Backup file $BASH_RC_BACKUP_PATH already exists============='
else
    echo '===Backup file $BASH_RC_BACKUP_PATH does not exist yet============='
    sudo cp $BASH_RC_PATH $BASH_RC_BACKUP_PATH;
	echo '===Backup file $BASH_RC_BACKUP_PATH is created now============='
fi

echo '===Set the needed environment variables=============';
echo 'export JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64' >> $BASH_RC_PATH;

echo '===Finish instaling '$INSTALLED_MODULE_NAME'=============';

echo '===Check '$INSTALLED_MODULE_NAME' version=============';
java -version;

echo '===Start installing SDKMAN!=============';
curl -s "https://get.sdkman.io" | bash;
source "$HOME/.sdkman/bin/sdkman-init.sh";

echo '===Change SDKMAN! timeout settings=============';
sed -i -e 's/sdkman_curl_connect_timeout=7/sdkman_curl_connect_timeout=7000/g' ~/.sdkman/etc/config;
sed -i -e 's/sdkman_curl_max_time=10/sdkman_curl_max_time=10000/g' ~/.sdkman/etc/config;

echo '===Install Maven=============';
sdk install maven;

echo '===Install Gradle=============';
sdk install gradle;

echo '===Install Springboot=============';
sdk install springboot;

echo '===Check versions of SDKMAN!, Maven, Gradle, and Springboot=============';
sdk version;

mvn -version;

gradle -v;

spring --version;

echo '===Please dont forget to reboot your computer so that the updated environment variables are recognized by the computer=============';
