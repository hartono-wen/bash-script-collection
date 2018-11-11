#!/bin/bash

echo "Define website name. I prefer the website name the same as the folder name.";
NEW_WEBSITE_NAME="hello-world";

echo "Define the directory path of the website. Note that the directory must contain index.html file.";
NEW_WEBSITE_FOLDER="$HOME/Desktop/workspace/nginx-secondary-folder/$NEW_WEBSITE_NAME";

echo "Define nginx conf.d directory.";
NGINX_CONF_D_FOLDER="/etc/nginx/conf.d";

echo "Define the port that we will use";
NEW_WEBSITE_PORT="80";

echo "Define the new website address. I prefer the website address the same as the website name.";
NEW_WEBSITE_ADDRESS=$NEW_WEBSITE_NAME;

echo "Grant read-only permission to all objects in the directory so that Nginx will be able to access it."
sudo chmod -R 755 $NEW_WEBSITE_FOLDER;

echo "Copy default Nginx configuration for new website configuration";
sudo cp $NGINX_CONF_D_FOLDER/default.conf $NGINX_CONF_D_FOLDER/$NEW_WEBSITE_NAME.conf;

echo "Change port number that we will use for new website configuration";
sudo sed -i 's@listen       80;@listen       '$NEW_WEBSITE_PORT';@g' $NGINX_CONF_D_FOLDER/$NEW_WEBSITE_NAME.conf;

echo "Change website address that we will use for new website configuration";
sudo sed -i 's@server_name  localhost;@server_name  '$NEW_WEBSITE_ADDRESS';@g' $NGINX_CONF_D_FOLDER/$NEW_WEBSITE_NAME.conf;

echo "Change root location for new website configuration";
sudo sed -i 's@/usr/share/nginx/html;@'$NEW_WEBSITE_FOLDER';@g' $NGINX_CONF_D_FOLDER/$NEW_WEBSITE_NAME.conf;

echo "Add mapping from 127.0.0.1 to the new website in local computer.";
echo "127.0.0.1	$NEW_WEBSITE_ADDRESS" | sudo tee -a /etc/hosts;

echo "Restart Nginx service";
sudo /etc/init.d/nginx restart;

echo "The website can be accessed at URL: http://$NEW_WEBSITE_NAME:$NEW_WEBSITE_PORT";
