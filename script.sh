#!/bin/bash
sudo apt-get update
sudo apt-get install masscan
sudo iptables -A INPUT -p tcp -i eth0 --dport 61234 -j DROP
sudo masscan 0.0.0.0/0 -p80,21-23,3389,441,25,U:161 --banners --exclude 255.255.255.255 --adapter-port 61234 --rate 3000000 -oL data1 --shard 1/8
sudo masscan 0.0.0.0/0 -p80,21-23,3389,441,25,U:161 --banners --exclude 255.255.255.255 --adapter-port 61234 --rate 3000000 -oL data2 --shard 2/8
sudo masscan 0.0.0.0/0 -p80,21-23,3389,441,25,U:161 --banners --exclude 255.255.255.255 --adapter-port 61234 --rate 3000000 -oL data3 --shard 3/8
sudo masscan 0.0.0.0/0 -p80,21-23,3389,441,25,U:161 --banners --exclude 255.255.255.255 --adapter-port 61234 --rate 3000000 -oL data4 --shard 4/8
sudo masscan 0.0.0.0/0 -p80,21-23,3389,441,25,U:161 --banners --exclude 255.255.255.255 --adapter-port 61234 --rate 3000000 -oL data5 --shard 5/8
sudo masscan 0.0.0.0/0 -p80,21-23,3389,441,25,U:161 --banners --exclude 255.255.255.255 --adapter-port 61234 --rate 3000000 -oL data6 --shard 6/8
sudo masscan 0.0.0.0/0 -p80,21-23,3389,441,25,U:161 --banners --exclude 255.255.255.255 --adapter-port 61234 --rate 3000000 -oL data7 --shard 7/8
sudo masscan 0.0.0.0/0 -p80,21-23,3389,441,25,U:161 --banners --exclude 255.255.255.255 --adapter-port 61234 --rate 3000000 -oL data8 --shard 8/8
for i in `seq 1 8`;
        do
                sed 's/,//g' data$i > dat$i
                awk '{if($1=="banner"){out=""; for(i=6;i<=NF;i++){out=out" "$i}; print $3","$4","$out}}' dat$i > b$i.csv
				awk '{if($1=="open"){print $3","$4",NO"}}' dat$i > nb$i.csv
        done   
sudo apt-get install apache2
sudo apt-get install php libapache2-mod-php
sudo a2enmod mpm_prefork && sudo a2enmod php7.0
sudo service apache2 start
sudo apt install mysql-server
sudo apt install php-pear php-fpm php-dev php-zip php-curl php-xmlrpc php-gd php-mysql php-mbstring php-xml libapache2-mod-php
sudo service mysql start

