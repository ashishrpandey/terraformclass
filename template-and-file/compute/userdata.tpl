#!/bin/bash
yum install:-y
echo "Message from the server: ${message}" >> /var/www/html/index.html
service httpd start
chkconfig httpd on