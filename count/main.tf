terraform {
  required_providers {

    aws = {
      source  = "hashicorp/aws"
      version = "3.45.0"

    }
  }
}


variable "user_names" {
  description = "A list of names"
  type        = list(string)
  default     = ["neo","trinity", "morpheus"]
}


resource "aws_iam_user" "example" {
  count = 3
  name     = var.user_names[count.index]
}



output "all_users" {
  value = aws_iam_user.example
}
