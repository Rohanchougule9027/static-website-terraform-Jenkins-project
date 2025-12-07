provider "aws" {
    region = "ap-southeast-1"
  
}

resource "aws_instance" "staticweb" {
  ami = "ami-0933f1385008d33c4"
  instance_type = "t2.micro"
  key_name = "jumpserver"
  vpc_security_group_ids = ["sg-0f7721c15c4568561"]
  user_data = file(var.user_data)
  tags = {
    Name= "staticWeb"
  }
}

output "ec2_public_ip" {
  value = aws_instance.staticweb
}

