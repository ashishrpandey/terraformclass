## On a Centos Machine OR Amzon Linux 2 Machine - 

    sudo su - 
    wget https://releases.hashicorp.com/terraform/0.15.0/terraform_0.15.0_linux_amd64.zip
    unzip terraform_0.15.0_linux_amd64.zip
    mv terraform /usr/bin/
    rm  -f terraform_0.15.0_linux_amd64.zip
    
    
## Initialize terraform 

### Create a terraform script 
    

    terraform init 
    
