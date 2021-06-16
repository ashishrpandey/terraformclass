#----------storage/main.tf-------
terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "3.45.0"
    }
  }

   backend "s3" {
    bucket = "ibm-terraform-training"
    key    = "remotestate.tfstate"
    region = "ap-south-1"
  }

}

provider "aws" {
  region = "us-east-1"
}

# Create a random id 

resource "random_id" "tf_bucket_id" {
  byte_length = 2
}

# Create the bucket

resource "aws_s3_bucket" "ashish_bucket" {
  bucket        = "ashish-${var.project_name}-${random_id.tf_bucket_id.dec}"
  acl           = "private"
  force_destroy = true
  tags  = {
    Name = "tf_bucket"
  }
}
resource "aws_s3_bucket" "tf_code" {
  bucket        = "${var.project_name}-${random_id.tf_bucket_id.dec}"
  acl           = "private"
  force_destroy = true
  tags  = {
    Name = "tf_bucket"
  }
}
