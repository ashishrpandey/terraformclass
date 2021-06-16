provider "aws" {
  region = "ap-south-1"
}

locals {
  user_data = <<EOF
#!/bin/bash
echo "Hello Terraform!" >/home/ec2-user/hello.txt
EOF
}


##################################################################
# Data sources to get VPC, subnet, security group and AMI details
##################################################################
data "aws_vpc" "default" {
  default = true
}

data "aws_subnet_ids" "all" {
  vpc_id = data.aws_vpc.default.id
}

data "aws_ami" "amazon_linux" {
  most_recent = true

  owners = ["amazon"]

  filter {
    name = "name"

    values = [
      "amzn-ami-hvm-*-x86_64-gp2",
    ]
  }

  filter {
    name = "owner-alias"

    values = [
      "amazon",
    ]
  }
}

module "security_group" {
  source  = "terraform-aws-modules/security-group/aws"
  version = "~> 4.0"

  name        = "example"
  description = "Security group for example usage with EC2 instance"
  vpc_id      = data.aws_vpc.default.id

  ingress_cidr_blocks = ["0.0.0.0/0"]
  ingress_rules       = ["http-80-tcp","ssh"]
  egress_rules        = ["all-all"]
}

module "ec2" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "2.19.0"

  instance_count = 1
  user_data_base64 = base64encode(local.user_data)
  name          = "example-t2-unlimited"
  key_name      = "ashish-key"
  ami           = data.aws_ami.amazon_linux.id
  instance_type = "t2.micro"
  subnet_id     = tolist(data.aws_subnet_ids.all.ids)[0]
  #  private_ip = "172.31.32.10"
  vpc_security_group_ids      = [module.security_group.security_group_id]
  associate_public_ip_address = true
}



