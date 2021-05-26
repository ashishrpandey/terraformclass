#!/bin/bash
yum install git {pkg[count.undex]}  -y
echo "Message from the server: ${message}" >> /var/www/html/index.html
service httpd start
chkconfig httpd on

git clone github.com/ashishrpandey/ansible-playbooks
cd ansible-playbooks
ansible myansible.yaml

