# remove this part
provider "aws" {
    region = "us-east-1"
    access_key = "AKIA6DF4DESATARQ6VPN"
    secret_key = "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"
}


resource "aws_iam_user" "admin-user" {
  name = "carly"
  
  tags = {
    Description = "Jefe Tecnico"
  }
}