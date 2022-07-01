resource "aws_instance" "first-instance" {
    ami = "ami-0f65ab0fd913bc7be"
    instance_type = "t2.micro"

    tags = {
        Name = "server"
        Description = "Linux Ubuntu Server"

    }

        
}