#----------storage/main.tf-------

provider "aws" {
  region = "ap-south-1"
  access_key= "AAI4ABJCTLA3H4EAXA"
  secret_key= "hJadH+tTn5F8WEyXizwwwr2H81ZgqQ36qPQNA8"
}

# Create a random id 


# Create the bucket

resource "aws_s3_bucket" "tf_code" {
  bucket        = "${var.project_name}"
  acl           = "private"
  force_destroy = true

  tags {
    Name = "tf_bucket"
  }
}
