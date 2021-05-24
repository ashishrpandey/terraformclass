## On a Centos Machine OR Amzon Linux 2 Machine - 

    sudo su - 
    wget https://releases.hashicorp.com/terraform/0.15.0/terraform_0.15.0_linux_amd64.zip
    unzip terraform_0.15.0_linux_amd64.zip
    mv terraform /usr/bin/
    rm  -f terraform_0.15.0_linux_amd64.zip
    

## Install docker, as our first terraform provider
    
    yum update -y 
    yum install docker git -y 
    service docker start 
    
    git clone  https://github.com/ashishrpandey/terraformclass

### Create a terraform script 

refer to the file first-apply/main.tf 
    
## Initialize terraform 

    terraform init 
    
    
