terraform  {
 required_providers {

   aws = {
      source = "hashicorp/aws"
      version = "3.42.0"

  }
 }

  backend "s3" {
    bucket = "zekelabs-ibm-tf-backend"
    key    = "ibm-aws-tf.tfstate"
    region = "ap-south-1"
  }

}

provider "aws" {
  region = "ap-south-1"
}

resource "aws_instance" "web"{
	ami = "ami-010aff33ed5991201"
	instance_type = "t2.micro"
	key_name = "ashish-key"

  	provisioner "local-exec" {
    	command = "echo ${self.private_ip} > file.txt"
}	


}

