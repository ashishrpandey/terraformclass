terraform {
  required_providers {

    aws = {
      source  = "hashicorp/aws"
      version = "3.45.0"

    }
  }
}

provider "aws" {
  region = "ap-south-1"
}

variable "user_names" {
  description = "A list of names"
  type        = list(string)
#  default     = ["neo","trinity", "morpheus"]
  default     = ["neo", "morpheus"]
}

resource "aws_iam_user" "example" {
 count = length(var.user_names)  
 name = var.user_names[count.index]

# for_each = toset(var.user_names) 
# name     = each.value
}

output "all_users" {
 # value = values(aws_iam_user.example)[*].name
 value = aws_iam_user.example
}
