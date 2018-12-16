provider "aws" {
	}
resource "aws_key_pair" "ashish-key" {
	key_name = "ashish-key"
	public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQChoATn2P7U/dwctC803YV6bOweUGoOW4DECB2RupJC8po7H7cu7/RkHv0sG1Adct1bdQ9hOfAVjBjrePoEgorem8gR0vR7XD7WyGqfvsAvX5Cw0kAZgW4KU3HMD66EHzS0x9bhpJpwgFZPzLnBIqobBtEgeooZAtd0MEebEFP2uyLgEoEf3INYosEedJbbbXASOJOSLxici2WcyP/LItO4idprtryD04BIP9lH5Z8Ab0l0ANCLjk9u8PkoEt7HEO4fSWPFVoPE9ySRbPDvxhtOFggeNriHKYAVSQNt+7sXcdHadMB5TGl/xAAcEPcafOQjUgmxrJ6JuBWukhuuEJ77 root@ip-172-31-19-220.ap-southeast-1.compute.internal"
	}

resource "aws_instance" "web"{
	ami = "ami-009d6802948d06e52"
	instance_type = "t2.micro"
	key_name = "${aws_key_pair.ashish-key.key_name}"

  	provisioner "local-exec" {
    	command = "echo ${self.private_ip} > file.txt"
}	


}

