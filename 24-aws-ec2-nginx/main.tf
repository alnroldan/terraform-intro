resource "aws_instance" "webserver" {
    ami = "ami-0f65ab0fd913bc7be"
    instance_type = "t2.micro"

    tags = {
        Name = "webserver"
        Description = "nginx WebServer on Ubuntu"
    }

    user_data = <<-EOF
                #!/bin/bash
                sudo apt update
                sudo apt install nginx -y
                systemctl enable nginx
                systemctl star nginx
                EOF
    
}