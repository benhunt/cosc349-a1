#!/bin/bash

sudo apt-get update
sudo apt-get install -y mysql-server

sudo sed -i "s/bind-address.*/bind-address = 0.0.0.0/" /etc/mysql/mysql.conf.d/mysqld.cnf

sudo systemctl restart mysql

sudo mysql <<EOF
CREATE DATABASE IF NOT EXISTS study;
CREATE USER IF NOT EXISTS 'webuser'@'%' IDENTIFIED BY 'webpass';
GRANT ALL PRIVILEGES ON study.* TO 'webuser'@'%';
FLUSH PRIVILEGES;
EOF
