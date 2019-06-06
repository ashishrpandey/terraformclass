
Steps to get started on Terraform including installation of Terraform 0.11

    sudo su 
    yum install git wget unzip docker -y
    wget https://releases.hashicorp.com/terraform/0.11.1/terraform_0.11.1_linux_amd64.zip
    unzip terraform_0.11.1_linux_amd64.zip 
    service docker start
    mv terraform /usr/sbin/
