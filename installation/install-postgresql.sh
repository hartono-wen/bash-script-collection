#!/bin/bash

echo '===Start installing PostgreSQL=============';

echo '===Update the apt package index=============';
sudo apt-get update;

echo '===Install the needed application=============';
sudo apt-get install -y wget;

echo '===Add official repository for PostgreSQL=============';
sudo sh -c 'echo "deb http://apt.postgresql.org/pub/repos/apt/ $(lsb_release -sc)-pgdg main" > /etc/apt/sources.list.d/pgdg.list'

echo '===Import the repository signing key for PostgreSQL=============';
sudo wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo apt-key add -;

echo '===Update the apt package index=============';
sudo apt-get update;

echo '===Install PostgreSQL=============';
sudo apt-get install -y \
    postgresql-10 \
    postgresql-client-10 \
    pgadmin4;

echo '===Configure PostgreSQL settings=============';
sudo sh -c 'echo "host all  all    0.0.0.0/0  md5" >> /etc/postgresql/10/main/pg_hba.conf'
sudo sh -c $'echo "listen_addresses=\'*\'" >> /etc/postgresql/10/main/postgresql.conf'

echo '===Create superadmin user for PostgreSQL with password "123"=============';
sudo -i -u postgres psql --command "CREATE USER superadmin WITH SUPERUSER PASSWORD '123'";

echo '===Finish instaling PostgreSQL=============';

echo '===Check PostgreSQL version=============';
psql -V
