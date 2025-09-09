#!/bin/bash
set -e

sudo apt-get update
sudo apt-get install -y apache2

sudo mkdir -p /var/www/html/form
sudo cp /vagrant/form.html /var/www/html/form/index.html