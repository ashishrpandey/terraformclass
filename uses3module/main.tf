terraform  {
 required_providers {

   aws = {
      source = "hashicorp/aws"
      version = "3.45.0"

  }
 }
}

provider "aws" {
  region = "ap-south-1"
}

locals {
  bucket_name = "s3-bucket-ashish-ibm-tf"
}

resource "aws_iam_role" "this" {
  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "ec2.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF
}

data "aws_iam_policy_document" "bucket_policy" {
  statement {
    principals {
      type        = "AWS"
      identifiers = [aws_iam_role.this.arn]
    }

    actions = [
      "s3:ListBucket",
    ]

    resources = [
      "arn:aws:s3:::${local.bucket_name}",
    ]
  }
}

module "s3_bucket" {
  source  = "terraform-aws-modules/s3-bucket/aws"
  version = "2.4.0"

  bucket        = local.bucket_name
  acl           = "private"
  force_destroy = true

  attach_policy = true
  policy        = data.aws_iam_policy_document.bucket_policy.json

  attach_deny_insecure_transport_policy = true

  tags = {
    Owner = "Anton"
  }

  versioning = {
    enabled = true
  }
}
