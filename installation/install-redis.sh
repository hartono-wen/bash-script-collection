#!/bin/bash

INSTALLED_MODULE_NAME="Redis";

echo '===Start installing '$INSTALLED_MODULE_NAME'=============';

echo '===Update the apt package index=============';
sudo apt-get update;

echo '===Install the needed application=============';
sudo apt-get install -y build-essential tcl wget;

echo '===Download '$INSTALLED_MODULE_NAME$'\'s source code=============';
sudo wget -nc http://download.redis.io/redis-stable.tar.gz;

echo '===Extract '$INSTALLED_MODULE_NAME$'\'s source code=============';
sudo tar xvzf redis-stable.tar.gz;
cd redis-stable;

echo '===Test build '$INSTALLED_MODULE_NAME$'\'s source code and install=============';
sudo make;
sudo make install;

cd ..


echo '===Test build '$INSTALLED_MODULE_NAME$'\'s configuration=============';
sudo mkdir /etc/redis;
sudo cp ./redis-stable/redis.conf /etc/redis

echo '===Use systemd for '$INSTALLED_MODULE_NAME$'\'s management=============';
sudo sed -i 's@supervised no@supervised systemd@g' /etc/redis/redis.conf;
sudo sed -i 's@#   supervised systemd      - no supervision interaction@#   supervised no      - no supervision interaction@g' /etc/redis/redis.conf;

sudo sed -i 's@dir ./@dir /var/lib/redis@g' /etc/redis/redis.conf;

sudo sh -c "echo '[Unit]' > /etc/systemd/system/redis.service";
sudo sh -c "echo 'Description=Redis In-Memory Data Store' >> /etc/systemd/system/redis.service";
sudo sh -c "echo 'After=network.target' >> /etc/systemd/system/redis.service";

sudo sh -c "echo '' >> /etc/systemd/system/redis.service";

sudo sh -c "echo '[Service]' >> /etc/systemd/system/redis.service";
sudo sh -c "echo 'User=redis' >> /etc/systemd/system/redis.service";
sudo sh -c "echo 'Group=redis' >> /etc/systemd/system/redis.service";
sudo sh -c "echo 'ExecStart=/usr/local/bin/redis-server /etc/redis/redis.conf' >> /etc/systemd/system/redis.service";
sudo sh -c "echo 'ExecStop=/usr/local/bin/redis-cli shutdown' >> /etc/systemd/system/redis.service";
sudo sh -c "echo 'Restart=always' >> /etc/systemd/system/redis.service";

sudo sh -c "echo '' >> /etc/systemd/system/redis.service";

sudo sh -c "echo '[Install]' >> /etc/systemd/system/redis.service";
sudo sh -c "echo 'WantedBy=multi-user.target' >> /etc/systemd/system/redis.service";

echo '===Add user for '$INSTALLED_MODULE_NAME'=============';
sudo adduser --system --group --no-create-home redis;
sudo mkdir /var/lib/redis;
sudo chown redis:redis /var/lib/redis;
sudo chmod 770 /var/lib/redis;

echo '===Start '$INSTALLED_MODULE_NAME' service=============';
sudo systemctl start redis;

echo '===Check '$INSTALLED_MODULE_NAME' service status=============';
sudo systemctl status redis -l --no-pager;

echo '===Remove unneeded artifacts=============';
sudo rm ./redis-stable.tar.gz;
sudo rm -rf ./redis-stable;

echo '===Make '$INSTALLED_MODULE_NAME' service run automatically everytime the machine boots=============';
sudo systemctl enable redis -l --no-pager;

echo '===Finish instaling '$INSTALLED_MODULE_NAME'=============';

echo '===Check '$INSTALLED_MODULE_NAME' version=============';
redis-cli -v;
