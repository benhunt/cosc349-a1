#!/bin/bash
set -e

sudo apt-get update
sudo apt-get install -y apache2

sudo cp /vagrant/form.html /var/www/html/index.html

sudo systemctl restart apache2