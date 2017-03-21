#!/bin/bash

echo ==============================================================================
echo fix broken locale
echo ==============================================================================

# The default AMI is missing locale data, so we have to add it
sudo locale-gen en_AU.UTF-8

echo ==============================================================================
echo Configure Firewall 
echo ==============================================================================

## If you want to lock down HTTP
#sudo ufw allow from $HOME_IP_HTTP to any port 80

## If this box isn't going to be protected by a security group enable lock ip
#sudo ufw allow from $HOME_IP_SSH to any port 22

## If this box is only to be accessed by a jumpbox
#sudo ufw allow from 10.0.0.0/16 to any port 22

## If you want to protect the box with other measures (security groups etc)
sudo ufw allow ssh

## Enable HTTP
sudo ufw allow Apache

## Turn it on
sudo ufw --force enable

echo ==============================================================================
echo Secure shared memory \(requires restart\)
echo ==============================================================================

# Shared memory can be used to attack a running service secure it
sudo echo "tmpfs     /run/shm     tmpfs     defaults,noexec,nosuid     0     0"\
| sudo tee --append /etc/fstab

echo ==============================================================================
echo Harden network with sysctl settings
echo ==============================================================================

# Provent source routing of incoming packets
sudo cat /tmp/files/sysctl.conf | sudo tee --append /etc/sysctl.conf
## Reload sysctl
sudo sysctl -p

echo ==============================================================================
echo Prevent IP spoofing
echo ==============================================================================

sudo echo "nospoof on" | sudo tee --append /etc/host.conf

echo ==============================================================================
echo Configure Apache #
echo ==============================================================================

# add mod headers so we can disable ETags
pushd /etc/apache2/mods-enabled
sudo ln -s ../mods-available/headers.load headers.load
popd
# Configure Apache to not tell everyone what it is
sudo mv -f /tmp/files/security.conf /etc/apache2/conf-available/
# Add a default site
sudo mv /tmp/files/index.html /var/www/html/index.html
sudo service apache2 restart

echo ==============================================================================
echo Configure fail2ban
echo ==============================================================================

# Fail2Ban will scrape logs and look for things that are suspicious and ban 
# those IPs for 10 minutes, we want to set it up for apache, and ignore our IPs

sudo echo "[DEFAULT]" >> /tmp/files/f2b-ga.conf
sudo echo "ignoreip = 127.0.0.1/8 ${HOME_IP_SSH} ${HOME_IP_HTML}" \
>> /tmp/files/f2b-ga.conf

sudo mv /tmp/files/f2b-ga.conf /etc/fail2ban/jail.d/

sudo service fail2ban restart