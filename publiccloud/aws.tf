terraform  {
 required_providers {

   aws = {
      source = "hashicorp/aws"
      version = "3.45.0"

  }
 }

#  backend "s3" {
#    bucket = "zekelabs-ibm-tf-backend"
#    key    = "ibm-aws-tf.tfstate"
#    region = "ap-south-1"
#  }

}

provider "aws" {
  region = "ap-south-1"
}

resource "aws_key_pair" "ashish-key" {
	key_name = "ashish-key-2"
	public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQC4+JnFsSev5m8YV0iJ5wOIEGtM2by40ELFTPi8ugjIw1ij8nFermg2XGOnRwDee0C1zY8aEQ0Wg5XDvpfwpds1ENSuQviiJVu29db+CXbneXyXDRPhb/y9xj+3aZnzsgZQNGULyAaoW0DzKKZ/VcyylgcYTB10uHuHTUkFvStqaDJyXEC0o7cBZ9zgu/zPeDY0Zv4uPqs+OZaQrCsLQbpBxcW5PU6E8J/WQVjUzv+1FHzccsvHRjeO2JLB6iEMoivSaGdEIPNpcwERmERtIpahDD53lyCVSBtXw1sQc9gpRlKdsSZEOfxJxX0vXXOhlDDde0GANimm1gOBK9DdzTrx root@ip-172-31-37-255.ap-south-1.compute.internal"
	}

resource "aws_instance" "web"{
	ami = "ami-010aff33ed5991201"
	instance_type = "t2.micro"
#	key_name = "${aws_key_pair.ashish-key.key_name}"
	key_name = "ibm-key"

  	provisioner "local-exec" {
    	command = "echo ${self.public_ip} > file.txt"
}	


}

