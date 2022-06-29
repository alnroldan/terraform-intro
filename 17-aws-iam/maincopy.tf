# remove this part
provider "aws" {
    region = "us-east-1"
    access_key = ""
    secret_key = ""
}


resource "aws_iam_user" "admin-user" {
  name = "carly"
  
  tags = {
    Description = "Jefe Tecnico"
  }
}