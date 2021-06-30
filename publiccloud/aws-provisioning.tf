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
  region = "ap-southeast-1"
}

resource "aws_key_pair" "ashish-key" {
	key_name = "ashish-key"
        public_key = file("./ashish-key.pub")
	}

resource "aws_instance" "web"{
	#ami = "ami-010aff33ed5991201"
	ami = "ami-0e8e39877665a7c92"
	instance_type = "t2.micro"
	key_name = "${aws_key_pair.ashish-key.key_name}"

	tags = {
        	name = "ashish"
	}
        provisioner "file" {
   		 source      = "./index.html"
    		 destination = "/home/ec2-user/index.html"
 	}

 	provisioner "remote-exec" {
        	inline = [
			"echo ${self.public_ip} > file.txt",
			"sudo yum install httpd -y",
			"sudo service httpd start",
                        "sudo cp /home/ec2-user/index.html /var/www/html/index.html"
			]
		}	
	connection {
    			type     = "ssh"
    			user     = "ec2-user"
                	host = self.public_ip 
                	private_key = file("./ashish-key")
  		}


}

