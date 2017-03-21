#!/bin/bash

sudo apt-get update
sudo apt-get dist-upgrade

# Install apache
sudo apt-get install -y apache2
sudo apt-get install -y apache2-utils

# Install firewall
sudo apt-get install -y ufw

# Install fail2ban to monitor logs and block dodgy IPs
sudo apt-get install -y fail2ban