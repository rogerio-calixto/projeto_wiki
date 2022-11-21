#!/bin/bash
sudo su
mkdir -p /var/www
apt-get update
apt-get install -y nfs-common
echo "${efs-id}:/ /var/www nfs4 nfsvers=4.1,rsize=1048576,wsize=1048576,hard,timeo=600,retrans=2,noresvport,_netdev 0 0" >> /etc/fstab
mount -a

apt-get install -y apache2 php
apt-get install -y php7.4-mysql php7.4-curl php7.4-gd php7.4-intl php7.4-xml php7.4-zip php7.4-json php7.4-mbstring php7.4-ldap php7.4-bz2
wget http://virtualhost-wordpress.conf.s3-website-us-east-1.amazonaws.com/site.conf
mv site.conf /etc/apache2/sites-available/
wget https://github.com/glpi-project/glpi/releases/download/10.0.2/glpi-10.0.2.tgz
tar -zxvf glpi-10.0.2.tgz
chown -R www-data.www-data glpi
mv glpi /var/www/site
a2ensite site.conf
a2enmod rewrite
a2dissite 000-default.conf
service apache2 restart
rm -f glpi-10.0.2.tgz
echo "Instalacao terminada"