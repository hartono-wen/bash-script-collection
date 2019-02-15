#!/bin/bash

INSTALLED_MODULE_NAME="PostgreSQL";

echo '===Start installing '$INSTALLED_MODULE_NAME'=============';

echo '===Update the apt package index=============';
sudo apt-get update;

echo '===Install the needed application=============';
sudo apt-get install -y wget;

echo '===Add '$INSTALLED_MODULE_NAME$'\'s official repository =============';
sudo sh -c 'echo "deb http://apt.postgresql.org/pub/repos/apt/ $(lsb_release -sc)-pgdg main" > /etc/apt/sources.list.d/pgdg.list'

echo '===Import '$INSTALLED_MODULE_NAME$'\'s repository signing key=============';
sudo wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo apt-key add -;

echo '===Update the apt package index=============';
sudo apt-get update;

echo '===Install '$INSTALLED_MODULE_NAME'=============';
sudo apt-get install -y \
    postgresql-10 \
    postgresql-client-10 \
    pgadmin4;

echo '===Configure '$INSTALLED_MODULE_NAME' settings=============';
sudo sh -c 'echo "host all  all    0.0.0.0/0  md5" >> /etc/postgresql/10/main/pg_hba.conf'
sudo sh -c $'echo "listen_addresses=\'*\'" >> /etc/postgresql/10/main/postgresql.conf'

echo '===Create superadmin user for '$INSTALLED_MODULE_NAME' with password "123"=============';
sudo -i -u postgres psql --command "CREATE USER superadmin WITH SUPERUSER PASSWORD '123'";

echo '===Finish instaling '$INSTALLED_MODULE_NAME'=============';

echo '===Check '$INSTALLED_MODULE_NAME' version=============';
psql -V
