provider "aws" {
  region = "us-east-1"
}

variable "name" {
  description = "Name the instance on deploy"
}

resource "aws_instance" "DevOps-Jenkins" {
  ami           = "ami-0885b1f6bd170450c"
  instance_type = "t2.micro"
  key_name      = "devops"

  tags = {
    Name = "aws_instance.DevOps-Jenkins"
  }
}
