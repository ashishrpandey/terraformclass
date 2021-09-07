#!/bin/bash
sudo yum install httpd -y
echo "Subnet for Firewall: ${firewall_subnets}" >> /var/www/html/index.html
sudo service httpd start
chkconfig httpd on
