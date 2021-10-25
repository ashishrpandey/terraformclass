#----------storage/main.tf-------
terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "3.47.0"
    }
  }
  backend "s3" {
    bucket = "ibm-zeke-training"
    key    = "terraform-backendfile.tfstate"
    region = "ap-south-1"
  }
}

provider "aws" {
  region = "ap-south-1"
}


# Create the bucket

resource "aws_s3_bucket" "tf_code" {
  bucket        = var.project_name
  acl           = "private"
  force_destroy = true

  tags = {
    Name = "tf_bucket"
  } 
}

resource "aws_s3_bucket_object" "object" {
  bucket = aws_s3_bucket.tf_code.id
  key    = "mylocalfile"
  source = "./mylocalfile"

  # The filemd5() function is available in Terraform 0.11.12 and later
  # For Terraform 0.11.11 and earlier, use the md5() function and the file() function:
  # etag = "${md5(file("path/to/file"))}"
 # etag = filemd5("path/to/file")
}


#module "s3_bucket" {
#  source = "terraform-aws-modules/s3-bucket/aws"
#
#  bucket = "ashish-zeke-module-bucket"
#  acl    = "private"
#
#  versioning = {
#    enabled = true
#  }

#}
