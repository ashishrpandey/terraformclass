aws_region = "ap-southeast-1"
project_name = "nirmaan-terraform"
vpc_cidr = "10.10.0.0/16"
public_cidrs = [
    "10.10.1.0/24",
    "10.10.2.0/24"
    ]
accessip = "0.0.0.0/0"
key_name = "nirmaan-key" 
public_key_path = "/home/ec2-user/nirmaan-key.pub"
server_instance_type = "t2.micro" 
instance_count = 2
