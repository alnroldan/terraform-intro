

terraform {
  required_providers {
    local = {
      source = "hashicorp/local"
      #version = "2.1.0"
      #version = "!= 2.1.0"
      #version = "< 2.1.0"
      #version = "> 2.1.0"
      #version = "> 2.1.0, <=2.2.2, !=2.2.1"
      version = "~> 2.1"
    }
  }
}

provider "local" {
  # Configuration options
}



resource local_file "my-file" {
  content = "hola"
  filename             = "${path.module}/out/file.txt"
  
}
