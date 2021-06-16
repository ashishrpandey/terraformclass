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
#  region = "ap-south-1"
}

# Create a random id 

resource "random_id" "tf_bucket_id" {
  byte_length = 2
  count = 3

}

variable "project_name" {
  description = "projectname"
  default = "zeke-project"
}

variable "bucket_region" {
  description = "Create one bucket in each region"
  type = list
  default = ["us-east-1", "us-east-2", "ap-south-1"]
}


# Create the bucket
resource "aws_s3_bucket" "tf_code" {
  count         = 3
  region 	= var.bucket_region[count.index]
  bucket        = "${var.project_name}-${random_id.tf_bucket_id.*.dec[count.index]}"
  acl           = "private"
  force_destroy = true

  tags = {
    Name = "tf_bucket-${count.index}"
  }
}

output "bucket_names" {
value = "${aws_s3_bucket.tf_code.*.id}"
}
